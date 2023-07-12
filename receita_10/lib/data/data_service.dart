import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import '../util/ordernator.dart';

import '../data/models.dart';

enum TableStatus { idle, loading, ready, error }

enum ItemType {
  beer,
  coffee,
  nation,
  cannabis,
  none;

  String get asString => '$name';

  List<String> get columns => this == coffee
      ? ["Nome", "Origem", "Tipo"]
      : this == beer
          ? ["Nome", "Estilo", "IBU"]
          : this == nation
              ? ["Nome", "Capital", "Idioma", "Esporte"]
              : this == cannabis
                  ? ["Strain", "Health Benefits", "Category"]
                  : [];

  List<String> get properties => this == coffee
      ? ["blend_name", "origin", "variety"]
      : this == beer
          ? ["name", "style", "ibu"]
          : this == nation
              ? ["nationality", "capital", "language", "national_sport"]
              : this == cannabis
                  ? ["strain", "health_benefit", "category"]
                  : [];
}

class DataService {
  static const MAX_N_ITEMS = 15;
  static const MIN_N_ITEMS = 3;
  static const DEFAULT_N_ITEMS = 7;

  int _numberOfItems = DEFAULT_N_ITEMS;

  int get numberOfItems {
    return _numberOfItems;
  }

  set numberOfItems(int n) {
    _numberOfItems = n < 0
        ? MIN_N_ITEMS
        : n > MAX_N_ITEMS
            ? MAX_N_ITEMS
            : n;
  }

  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier({
    'status': TableStatus.idle,
    'dataObjects': [],
    'itemType': ItemType.none
  });

  List<Map<String, dynamic>> previous = [];

  void changeAtualState() {
    previous.removeLast();
    tableStateNotifier.value = previous.isNotEmpty
        ? previous[previous.length - 1]
        : {
            'status': TableStatus.idle,
            'dataObjects': [],
            'itemType': ItemType.none,
          };
  }

  void load(int index) {
    final params = [
      ItemType.coffee,
      ItemType.beer,
      ItemType.nation,
      ItemType.cannabis,
    ];

    loadByType(params[index]);
  }

  List<dynamic> filterCurrentState(String search) {
    List<dynamic> objects = tableStateNotifier.value['dataObjects'] ?? [];

    if (search.isEmpty) return objects;

    return objects.where((obj) {
      // Filtra os objetos com base em uma correspondência parcial do valor da propriedade com a pesquisa
      for (var property in tableStateNotifier.value['propertyNames']) {
        if (obj[property]
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase())) {
          return true;
        }
      }
      return false;
    }).toList();
  }

  void sortCurrentState(final String property, bool ascending) {
    List objects = tableStateNotifier.value['dataObjects'] ?? [];

    if (objects.isEmpty) return;

    objects.sort((a, b) => a[property].compareTo(b[property]));

    if (!ascending) {
      objects = objects.reversed.toList();
    }

    emitSortedState(objects, property, ascending);
  }

  Uri buildUri(ItemType type) {
    return Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/${type.asString}/random_${type.asString}',
      queryParameters: {'size': '$_numberOfItems'},
    );
  }

  Future<List<dynamic>> accessApi(Uri uri, ItemType type) async {
    var jsonString = await http.read(uri);

    var json = jsonDecode(jsonString);

    List<dynamic> items;

    switch (type) {
      case ItemType.beer:
        items = json.map<Beer>((itemJson) => Beer.fromJson(itemJson)).toList();
        break;
      case ItemType.coffee:
        items =
            json.map<Coffee>((itemJson) => Coffee.fromJson(itemJson)).toList();
        break;
      case ItemType.nation:
        items =
            json.map<Nation>((itemJson) => Nation.fromJson(itemJson)).toList();
        break;
      case ItemType.cannabis:
        items = json
            .map<Cannabis>((itemJson) => Cannabis.fromJson(itemJson))
            .toList();
        break;
      default:
        items = [];
    }

    return [...tableStateNotifier.value['dataObjects'], ...items];
  }

  void emitSortedState(
      List<dynamic> sortedObjects, String property, bool ascending) {
    var state = Map<String, dynamic>.from(tableStateNotifier.value);

    state['dataObjects'] = sortedObjects;
    state['sortColumnIndex'] = property; // Armazena a coluna selecionada
    state['sortAscending'] = ascending; // Armazena a ordem de classificação

    tableStateNotifier.value = state;
    previous.add(tableStateNotifier.value);
  }

  void emitLoadingState(ItemType type) {
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': [],
      'itemType': type
    };
  }

  void emitReadyState(ItemType type, List<dynamic> data) {
    tableStateNotifier.value = {
      'itemType': type,
      'status': TableStatus.ready,
      'dataObjects': data,
      'propertyNames': type.properties,
      'columnNames': type.columns,
    };
    previous.add(tableStateNotifier.value);
  }

  bool isRequestPending() =>
      tableStateNotifier.value['status'] == TableStatus.loading;

  bool hasItemTypeChanged(ItemType type) =>
      tableStateNotifier.value['itemType'] != type;

  void loadByType(ItemType type) async {
    // Ignore request if a previous request is still pending
    if (isRequestPending()) return;

    if (hasItemTypeChanged(type)) {
      emitLoadingState(type);
    }

    var uri = buildUri(type);

    var json = await accessApi(uri, type);

    emitReadyState(type, json);
  }
}

final dataService = DataService();

class JsonComparator extends Decider {
  final String property;
  final bool ascending;

  JsonComparator(this.property, [this.ascending = true]);

  @override
  bool needsToSwap(current, next) {
    try {
      return current[property].compareTo(next[property]) > 0;
    } catch (error) {
      return false;
    }
  }
}