import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models.dart';

enum TableStatus { idle, loading, ready, error }

enum ItemType {
  beer,
  coffee,
  nation,
  cannabis,
  none,
}

extension ItemTypeExtension on ItemType {
  List<String> get columns {
    switch (this) {
      case ItemType.coffee:
        return ["Nome", "Origem", "Tipo"];
      case ItemType.beer:
        return ["Nome", "Estilo", "IBU"];
      case ItemType.nation:
        return ["Nome", "Capital", "Idioma", "Esporte"];
      case ItemType.cannabis:
        return ["Strain", "Benefícios para a saúde", "Categoria"];
      default:
        return [];
    }
  }

  List<String> get properties {
    switch (this) {
      case ItemType.coffee:
        return ["blend_name", "origin", "variety"];
      case ItemType.beer:
        return ["name", "style", "ibu"];
      case ItemType.nation:
        return ["nationality", "capital", "language", "national_sport"];
      case ItemType.cannabis:
        return ["strain", "health_benefit", "category"];
      default:
        return [];
    }
  }

  String get asString {
    return this.toString().split('.').last;
  }
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
    'itemType': ItemType.none,
  });

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
    List<dynamic> objects = List.of(tableStateNotifier.value['dataObjects'] ?? []);

    if (objects.isEmpty) return;

    objects.sort((a, b) {
      if (a[property] is String && b[property] is String) {
        return a[property].compareTo(b[property]);
      } else if (a[property] is num && b[property] is num) {
        return a[property].compareTo(b[property]);
      }
      return 0;
    });

    if (!ascending) {
      objects = objects.reversed.toList();
    }

    emitSortedState(objects, property, ascending);
  }

  Uri buildUri(ItemType type, int numberOfItems) {
    return Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/${type.asString}/random_${type.asString}',
      queryParameters: {'size': '$numberOfItems'},
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
        items = json.map<Coffee>((itemJson) => Coffee.fromJson(itemJson)).toList();
        break;
      case ItemType.nation:
        items = json.map<Nation>((itemJson) => Nation.fromJson(itemJson)).toList();
        break;
      case ItemType.cannabis:
        items = json.map<Cannabis>((itemJson) => Cannabis.fromJson(itemJson)).toList();
        break;
      default:
        items = [];
    }

    return items;
  }

  void emitSortedState(List<dynamic> sortedObjects, String property, bool ascending) {
    var state = Map<String, dynamic>.from(tableStateNotifier.value);

    state['dataObjects'] = sortedObjects;
    state['sortColumnIndex'] = property; // Armazena a coluna selecionada
    state['sortAscending'] = ascending; // Armazena a ordem de classificação

    tableStateNotifier.value = state;
  }

  void emitLoadingState(ItemType type) {
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': [],
      'itemType': type,
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
  }

  bool isRequestPending() => tableStateNotifier.value['status'] == TableStatus.loading;

  bool hasItemTypeChanged(ItemType type) => tableStateNotifier.value['itemType'] != type;

  void loadByType(ItemType type) async {
    // Ignore request if a previous request is still pending
    if (isRequestPending()) return;

    if (hasItemTypeChanged(type)) {
      emitLoadingState(type);
    }

    var uri = buildUri(type, numberOfItems);

    var json = await accessApi(uri, type);

    emitReadyState(type, json);
  }

  void changeAtualState() {
    var state = Map<String, dynamic>.from(tableStateNotifier.value);

    // Implemente o comportamento desejado para alterar o estado atual
    // por exemplo, alterar os valores das propriedades do estado atual.

    tableStateNotifier.value = state;
  }
}

final dataService = DataService();
