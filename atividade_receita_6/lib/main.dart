import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier;
  final ValueNotifier<List<String>> columnNamesNotifier;
  final ValueNotifier<List<String>> propertyNamesNotifier;

  DataService()
      : tableStateNotifier = ValueNotifier([
          {
            "name": "Brasil",
            "capital": "Brasília",
            "population": "211 million"
          },
          {"name": "China", "capital": "Pequim", "population": "1.4 billion"},
          {"name": "Cuba", "capital": "Havana", "population": "11 million"}
        ]),
        columnNamesNotifier = ValueNotifier(["Nome", "Capital", "População"]),
        propertyNamesNotifier =
            ValueNotifier(["name", "capital", "population"]);

  void carregar(int index) {
    final Map<int, Function> carregamentos = {
      1: carregarCervejas,
      2: carregarCafes,
      3: carregarNacoes,
    };
    carregamentos[index]?.call();
  }

  void carregarCervejas() {
    columnNamesNotifier.value = ["Nome", "Estilo", "IBU"];
    propertyNamesNotifier.value = ["name", "style", "ibu"];
    tableStateNotifier.value = [
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"}
    ];
  }

  void carregarCafes() {
    columnNamesNotifier.value = ["Nome", "Origem", "Torra"];
    propertyNamesNotifier.value = ["name", "origin", "roast"];
    tableStateNotifier.value = [
      {"name": "Café Brasileiro", "origin": "Brasil", "roast": "Médio"},
      {"name": "Café Colombiano", "origin": "Colômbia", "roast": "Escuro"},
      {"name": "Café Etíope", "origin": "Etiópia", "roast": "Claro"}
    ];
  }

  void carregarNacoes() {
    columnNamesNotifier.value = ["Nome", "Capital", "População"];
    propertyNamesNotifier.value = ["name", "capital", "population"];
    tableStateNotifier.value = [
      {"name": "Brasil", "capital": "Brasília", "population": "211 million"},
      {"name": "China", "capital": "Pequim", "population": "1.4 billion"},
      {"name": "Cuba", "capital": "Havana", "population": "11 million"}
    ];
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
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Dicas"),
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(jsonObjects: value);
              }),
          bottomNavigationBar: NewNavBar(itemSelectedCallback: (index) {
            dataService.carregar(index + 1);
          }),
        ));
  }
}

class NewNavBar extends HookWidget {
  var itemSelectedCallback;
  // Function to create relationship between the class and the 'carregarCervejas'

  NewNavBar({this.itemSelectedCallback}) {
    itemSelectedCallback ??= (_) {};
  }

  @override
  Widget build(BuildContext context) {
    var state = useState(2);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;
          itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined)),
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  DataTableWidget({required this.jsonObjects});

  @override
  Widget build(BuildContext context) {
    final columnNames = dataService.columnNamesNotifier.value;
    final propertyNames = dataService.propertyNamesNotifier.value;
    return DataTable(
      columns: columnNames
          .map((name) => DataColumn(
              label: Expanded(
                  child: Text(name,
                      style: const TextStyle(fontStyle: FontStyle.normal)))))
          .toList(),
      rows: jsonObjects
          .map((obj) => DataRow(
              cells: propertyNames
                  .map((propName) => DataCell(Text(obj[propName])))
                  .toList()))
          .toList(),
    );
  }
}