import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../util/ordernator.dart';

enum TableStatus { idle, loading, ready, error }

enum ItemType {
  beer,
  coffee,
  nation,
  none,
}

extension ItemTypeExtension on ItemType {
  String get asString {
    switch (this) {
      case ItemType.beer:
        return 'beer';
      case ItemType.coffee:
        return 'coffee';
      case ItemType.nation:
        return 'nation';
      default:
        return '';
    }
  }

  List<String> get columns {
    switch (this) {
      case ItemType.coffee:
        return ['Nome', 'Origem', 'Tipo'];
      case ItemType.beer:
        return ['Nome', 'Estilo', 'IBU'];
      case ItemType.nation:
        return ['Nome', 'Capital', 'Idioma', 'Esporte'];
      default:
        return [];
    }
  }

  List<String> get properties {
    switch (this) {
      case ItemType.coffee:
        return ['blend_name', 'origin', 'variety'];
      case ItemType.beer:
        return ['name', 'style', 'ibu'];
      case ItemType.nation:
        return ['nationality', 'capital', 'language', 'national_sport'];
      default:
        return [];
    }
  }
}

class DataService {
  static const MAX_N_ITEMS = 15;
  static const MIN_N_ITEMS = 3;
  static const DEFAULT_N_ITEMS = 7;

  int _numberOfItems = DEFAULT_N_ITEMS;

  int get numberOfItems => _numberOfItems;

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

  void carregar(int index) {
    final params = [ItemType.coffee, ItemType.beer, ItemType.nation];
    carregarPorTipo(params[index]);
  }

  void ordenarEstadoAtual(int columnIndex, bool ascending) {
    List objetos = tableStateNotifier.value['dataObjects'] ?? [];

    if (objetos.isEmpty) return;

    Ordenador ord = Ordenador();
    var objetosOrdenados = [];

    final type = tableStateNotifier.value['itemType'];

    if (type == ItemType.beer && columnIndex == 0) {
      objetosOrdenados = ord.ordenarFuderoso(
        objetos,
        DecididorCervejaNomeCrescente(),
      );
    } else if (type == ItemType.beer && columnIndex == 1) {
      objetosOrdenados = ord.ordenarFuderoso(
        objetos,
        DecididorCervejaEstiloCrescente(),
      );
    }

    if (!ascending) {
      objetosOrdenados = objetosOrdenados.reversed.toList();
    }

    emitirEstadoOrdenado(objetosOrdenados);
  }

  Uri montarUri(ItemType type) {
    return Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/${type.asString}/random_${type.asString}',
      queryParameters: {'size': '$_numberOfItems'},
    );
  }

  Future<List<dynamic>> acessarApi(Uri uri) async {
    var jsonString = await http.read(uri);
    var json = jsonDecode(jsonString);

    json = [...tableStateNotifier.value['dataObjects'], ...json];

    return json;
  }

  void emitirEstadoOrdenado(List objetosOrdenados) {
    var estado = Map<String, dynamic>.from(tableStateNotifier.value);
    estado['dataObjects'] = objetosOrdenados;
    tableStateNotifier.value = estado;
  }

  void emitirEstadoCarregando(ItemType type) {
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': [],
      'itemType': type,
    };
  }

  void emitirEstadoPronto(ItemType type, var json) {
    tableStateNotifier.value = {
      'itemType': type,
      'status': TableStatus.ready,
      'dataObjects': json,
      'propertyNames': type.properties,
      'columnNames': type.columns,
    };
  }

  bool temRequisicaoEmCurso() =>
      tableStateNotifier.value['status'] == TableStatus.loading;

  bool mudouTipoDeItemRequisitado(ItemType type) =>
      tableStateNotifier.value['itemType'] != type;

  void carregarPorTipo(ItemType type) async {
    // Ignorar solicitação se uma requisição já estiver em curso
    if (temRequisicaoEmCurso()) return;

    if (mudouTipoDeItemRequisitado(type)) {
      emitirEstadoCarregando(type);
    }

    var uri = montarUri(type);
    var json = await acessarApi(uri);
    emitirEstadoPronto(type, json);
  }

  void atualizarNumeroDeItens(int numero) {
    numberOfItems = numero;
    if (tableStateNotifier.value['status'] == TableStatus.ready) {
      carregarPorTipo(tableStateNotifier.value['itemType']);
    }
  }
}

final dataService = DataService();

class DecididorCervejaNomeCrescente extends Decididor {
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try {
      return atual['name'].compareTo(proximo['name']) > 0;
    } catch (error) {
      return false;
    }
  }
}

class DecididorCervejaEstiloCrescente extends Decididor {
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try {
      return atual['style'].compareTo(proximo['style']) > 0;
    } catch (error) {
      return false;
    }
  }
}

class DecididorCervejaNomeDecrescente extends Decididor {
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try {
      return atual['name'].compareTo(proximo['name']) < 0;
    } catch (error) {
      return false;
    }
  }
}

class DecididorCervejaEstiloDecrescente extends Decididor {
  @override
  bool precisaTrocarAtualPeloProximo(atual, proximo) {
    try {
      return atual['style'].compareTo(proximo['style']) < 0;
    } catch (error) {
      return false;
    }
  }
}
