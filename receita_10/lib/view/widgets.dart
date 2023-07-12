import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:receita_10/components/Drawer.dart';
import '../data/data_service.dart';

const listNumbers = [3, 7, 17];

class MyApp extends StatelessWidget {
  void handleSearch(String search) {
    var state = Map<String, dynamic>.from(dataService.tableStateNotifier.value);
    state['dataObjects'] = dataService.filterCurrentState(search);
    dataService.tableStateNotifier.value = state;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MyAppBar(
            callback: dataService.sortCurrentState,
            searchCallback: handleSearch,
          ),
        ),
        drawer: DrawerApp(logoutCallback: () {  },), // Adiciona o Drawer personalizado
        body: ValueListenableBuilder(
          valueListenable: dataService.tableStateNotifier,
          builder: (_, value, __) {
            switch (value['status']) {
              case TableStatus.idle:
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/saopaulo.png',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(height: 16),
                        const Text("Pressione ENTER para continuar...")
                      ],
                    ),
                  ),
                );
              case TableStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case TableStatus.ready:
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTableWidget(
                      jsonObjects: value['dataObjects'],
                      propertyNames: value['propertyNames'],
                      columnNames: value['columnNames'],
                    ),
                  ),
                );
              case TableStatus.error:
                return Text("Lascou");
            }
            return Text("...");
          },
        ),
        bottomNavigationBar: NewNavBar(itemSelectedCallback: dataService.load),
      ),
    );
  }
}

class NewNavBar extends HookWidget {
  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(0);

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
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined),
        ),
        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_outlined),
        ),
        BottomNavigationBarItem(
          label: "Weed",
          icon: Icon(Icons.forest),
        ),
      ],
    );
  }
}

class DataTableWidget extends HookWidget {
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
    final sortAscending = useState(true);
    final sortColumnIndex = useState(1);
    return DataTable(
      sortAscending: sortAscending.value,
      sortColumnIndex: sortColumnIndex.value,
      columns: columnNames
          .map(
            (name) => DataColumn(
              onSort: (columnIndex, ascending) {
                sortColumnIndex.value = columnIndex;
                sortAscending.value = !sortAscending.value;
                dataService.sortCurrentState(
                  propertyNames[columnIndex],
                  sortAscending.value,
                );
              },
              label: Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          )
          .toList(),
      rows: jsonObjects
          .map(
            (obj) => DataRow(
              cells: propertyNames
                  .map(
                    (propName) => DataCell(
                      Text(obj[propName]),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

class MyAppBar extends HookWidget {
  final callback;
  final searchCallback;

  MyAppBar({this.callback, this.searchCallback});

  @override
  Widget build(BuildContext context) {
    var state = useState(7);
    var searchState = useState('');

    return AppBar(
      title: Container(
        margin: const EdgeInsets.only(top: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextField(
          onChanged: (value) {
            searchState.value = value;
            if (searchState.value.length >= 3) {
              searchCallback(searchState.value);
            }
          },
          decoration: const InputDecoration(
            hintText: 'Digite algo...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {
            showFilterMenu(context, state);
          },
        ),
      ],
    );
  }

  void showFilterMenu(BuildContext context, ValueNotifier<int> state) {
    final List<PopupMenuEntry<int>> menuItems = listNumbers.map((number) {
      return PopupMenuItem(
        value: number,
        child: Text("Carregar $number itens por vez"),
      );
    }).toList();

    showMenu<int>(
      context: context,
      position: RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
      items: menuItems,
    ).then((value) {
      if (value != null) {
        // Ação a ser executada quando uma opção do filtro for selecionada
        state.value = value;
        dataService.numberOfItems = value;
      }
    });
  }
}
