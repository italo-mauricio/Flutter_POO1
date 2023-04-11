import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Center(child: Text("Página 1")),
    Center(child: Text("Página 2")),
    Center(child: Text("Página 3")),
    Center(child: Text("Página 4")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: NewNavBar(
          key: UniqueKey(),
          icons: const [
            Icon(Icons.home, color: Colors.red),
            Icon(Icons.ac_unit, color: Colors.red),
            Icon(Icons.access_alarm, color: Colors.red),
            Icon(Icons.accessibility, color: Colors.red)
          ],
          onItemTapped: _onItemTapped,
          selectedIndex: _selectedIndex),
    );
  }
}

class NewNavBar extends StatelessWidget {
  final List<Icon> icons;
  final void Function(int) onItemTapped;
  final int selectedIndex;

  const NewNavBar({
    required Key key,
    this.icons = const [],
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      unselectedItemColor: Color.fromARGB(255, 7, 7, 7),
      items: icons
          .asMap()
          .map(
            (index, e) => MapEntry(
              index,
              BottomNavigationBarItem(
                icon: e,
                label: "Tela ${index + 1}",
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  NewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Aplicativo Padrão"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
