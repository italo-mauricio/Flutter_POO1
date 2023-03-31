import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(title: Text("Hello World")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Viva o Messi"),
              Text("Viva carlinhos bala"),
              Text("Viva alef manga"),
              Text("Olá mundo"),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor:
              Colors.blue, // cor do ícone e rótulo do item selecionado
          unselectedItemColor:
              Colors.green, // cor dos ícones e rótulos dos itens não selecionados
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "person",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_basketball),
              label: "sports_basketball",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: "access_time",
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}