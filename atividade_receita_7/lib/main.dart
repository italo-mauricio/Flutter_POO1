import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);
  final ValueNotifier<List<String>> columnNamesNotifier = new ValueNotifier([]);
  final ValueNotifier<List<String>> propertyNamesNotifier =
      new ValueNotifier([]);

  DataService() {
    loadBeers();
  }

  void load(index) {
    switch (index) {
      case 1:
        loadCoffees();
        break;
      case 2:
        loadBeers();
        break;
      case 3:
        loadNations();
        break;
    }
  }

  Future<void> loadBeers() async {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': '5'});

    var jsonString = await http.read(beersUri);

    var beersJson = jsonDecode(jsonString);

    propertyNamesNotifier.value = ["name", "brand", "ibu"];
    columnNamesNotifier.value = ["Name", "Brand", "IBU"];
    tableStateNotifier.value = beersJson;
  }

  Future<void> loadCoffees() async {
    var coffeesUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/coffee/random_coffee',
        queryParameters: {'size': '5'});

    var jsonString = await http.read(coffeesUri);

    var coffeesJson = jsonDecode(jsonString);

    propertyNamesNotifier.value = ["blend_name", "origin", "variety"];
    columnNamesNotifier.value = ["Blend Name", "Origin", "Variety"];
    tableStateNotifier.value = coffeesJson;
  }

  Future<void> loadNations() async {
    var nationsUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/nation/random_nation',
        queryParameters: {'size': '5'});

    var jsonString = await http.read(nationsUri);

    var nationsJson = jsonDecode(jsonString);

    columnNamesNotifier.value = ["Nationality", "Language", "Capital"];
    propertyNamesNotifier.value = ["nationality", "language", "capital"];
    tableStateNotifier.value = nationsJson;
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
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(jsonObjects: value);
              }),
          bottomNavigationBar: NewNavBar(itemSelectedCallback: (index) {
            dataService.load(index + 1);
          }),
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
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Coffes",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Beers", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nations", icon: Icon(Icons.flag_outlined))
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
                        style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}