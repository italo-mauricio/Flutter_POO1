import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

enum TableStatus { idle, loading, ready, error }

class DataService {
  final ValueNotifier<Map<String, dynamic>> tableStateNotifier = ValueNotifier(
      {'status': TableStatus.idle, 'dataObjects': [], 'columnNames': []});

  void carregar(index) {
    final funcoes = [
      carregarCafes,
      carregarCervejas,
      carregarNacoes,
      carregarErvas
    ];

    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': [],
      'columnNames': [],
    };

    funcoes[index]();
  }

  void carregarCafes() {
    var coffeesUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '5'});
    try {
      http.read(coffeesUri).then((jsonString) {
        var coffeesJson = jsonDecode(jsonString);

        tableStateNotifier.value = {
          'status': TableStatus.ready,
          'dataObjects': coffeesJson,
          'columnNames': ["Blend Name", "Origin", "Variety"],
          'propertyNames': ["blend_name", "origin", "variety"]
        };
      });
    } catch (err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': [],
        'columnNames': [],
      };
    }
  }

  Future<void> carregarNacoes() async {
    var nationsUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '5'});

    try {
      var jsonString = await http.read(nationsUri);

      var nationsJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': nationsJson,
        'columnNames': ["Nationality", "Language", "Capital"],
        'propertyNames': ["nationality", "language", "capital"]
      };
    } catch (err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': [],
        'columnNames': [],
      };
    }
  }

  void carregarCervejas() {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '5'});

    try {
      http.read(beersUri).then((jsonString) {
        var beersJson = jsonDecode(jsonString);

        tableStateNotifier.value = {
          'status': TableStatus.ready,
          'dataObjects': beersJson,
          'columnNames': ["Nome", "Estilo", "IBU"],
          'propertyNames': ["name", "style", "ibu"]
        };
      });
    } catch (err) {
      tableStateNotifier.value = {
        'status': TableStatus.error,
        'dataObjects': [],
        'columnNames': [],
      };
    }
  }

  void carregarErvas() {
    var cannabisUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/cannabis/random_cannabis',
        queryParameters: {'size': '5'});

    http.read(cannabisUri).then((jsonString) {
      var cannabisJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': cannabisJson,
        'columnNames': ["Strain", "Health Benefits", "Category"],
        'propertyNames': ["strain", "health_benefit", "category"]
      };
    });
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                  valueListenable: dataService.tableStateNotifier,
                  builder: (_, value, __) {
                    switch (value['status']) {
                      case TableStatus.idle:
                        return const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Bem vindo(a), pegue o seu café e fique a vontade!",
                                style: TextStyle(fontSize: 14.0),
                                textAlign: TextAlign.center,
                              ),
                              Icon(Icons.keyboard_double_arrow_down)
                            ]);

                      case TableStatus.loading:
                        return CircularProgressIndicator();

                      case TableStatus.ready:
                        return DataTableWidget(
                            jsonObjects: value['dataObjects'],
                            propertyNames: value['propertyNames'],
                            columnNames: value['columnNames']);

                      case TableStatus.error:
                        return const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Erro!",
                                style: TextStyle(fontSize: 14.0),
                                textAlign: TextAlign.center,
                              ),
                              Icon(Icons.error)
                            ]);
                    }

                    return Text("...");
                  }),
            ],
          )),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined)),
          BottomNavigationBarItem(label: "Erva", icon: Icon(Icons.forest))
        ]);
  }
}

class DataTableWidget extends HookWidget {
  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;

  const DataTableWidget(
      {super.key, this.jsonObjects = const [],
      this.columnNames = const ["Nome", "Estilo", "IBU"],
      this.propertyNames = const ["name", "style", "ibu"]});

  dynamic _compareMaker(String property, bool asc) {
    return asc
        ? (a, b) => a[property].compareTo(b[property]) as int
        : (a, b) => b[property].compareTo(a[property]) as int;
  }

  @override
  Widget build(BuildContext context) {
    var internalState = useState({
      'asc': true,
      'sortColumn': null,
      'objects': jsonObjects,
    });

    return SingleChildScrollView(
        child: DataTable(
            sortAscending: internalState.value['asc'] as bool,
            sortColumnIndex: internalState.value['sortColumn'] != null
                ? internalState.value['sortColumn'] as int
                : null,
            columns: columnNames
                .map((name) => DataColumn(
                    onSort: (index, isAscending) {
                      final compare =
                          _compareMaker(propertyNames[index], isAscending);
                      jsonObjects.sort(compare);
                      internalState.value = {
                        'objects': jsonObjects,
                        'sortColumn': index,
                        'asc': isAscending
                      };
                    },
                    label: Expanded(
                        child: Text(name,
                            style: const TextStyle(fontStyle: FontStyle.italic)))))
                .toList(),
            rows: jsonObjects
                .map((obj) => DataRow(
                    cells: propertyNames
                        .map((propName) => DataCell(Text(obj[propName])))
                        .toList()))
                .toList()));
  }
}