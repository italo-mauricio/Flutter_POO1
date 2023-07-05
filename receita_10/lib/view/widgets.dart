import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../data/data_service.dart';

const listNumbers = [3, 7, 17];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dicas"),
          actions: [
            PopupMenuButton(
              itemBuilder: (_) => listNumbers.map((num) {
                return PopupMenuItem(
                  value: num,
                  child: Text("Carregar $num itens por vez"),
                );
              }).toList(),
              onSelected: (number) {
                dataService.numberOfItems = number;
              },
            )
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder: (_, value, __) {
            switch (value['status']) {
              case TableStatus.idle:
                return const Center(child: Text("Toque em algum botão"));

              case TableStatus.loading:
                return const Center(child: CircularProgressIndicator());

              case TableStatus.ready:
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTableWidget(
                      jsonObjects: value['dataObjects'],
                      columnNames: value['columnNames'],
                      propertyNames: value['propertyNames'],
                    ),
                  ),
                );

              case TableStatus.error:
                return const Text("Erro!!");
            }

            return const Text("...");
          },
        ),
        bottomNavigationBar: NewNavBar(
          itemSelectedCallback: dataService.carregar,
        ),
      ),
    );
  }
}

class NewNavBar extends HookWidget {
  final Function(int) itemSelectedCallback;

  NewNavBar({required this.itemSelectedCallback});

  @override
  Widget build(BuildContext context) {
    var state = useState(0);

    return BottomNavigationBar(
      onTap: (index) {
        state.value = index;
        itemSelectedCallback(index);
      },
      currentIndex: state.value,
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),
        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined),
        ),
        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_outlined),
        ),
      ],
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;
  final List<String> columnNames;
  final List<String> propertyNames;

  DataTableWidget({
    this.jsonObjects = const [],
    this.columnNames = const [],
    this.propertyNames = const [],
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columnNames
          .asMap()
          .entries
          .map((entry) => DataColumn(
                onSort: (columnIndex, ascending) => dataService
                    .ordenarEstadoAtual(propertyNames[columnIndex]),
                label: Expanded(
                  child: Text(
                    entry.value,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ))
          .toList(),
      rows: jsonObjects.map((obj) {
        return DataRow(
          cells: propertyNames.map((propName) {
            return DataCell(
              Text(obj[propName]),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
