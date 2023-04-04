import 'package:flutter/material.dart';

void Atividade1() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _Index = 0;

  final List<Widget> _pages = [
    // adicione aqui os widgets que deseja exibir em cada página
    Center(child: Text("página 1")),
    Center(child: Text("Página 2")),
    Center(child: Text("Página 3")),
    Center(child: Text("Página 4")),
    Center(child: Text("página 5")),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _Index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ifilmes",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _Index,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _Index,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Inicial",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Visitas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer_outlined),
              label: "Esportes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: "access_time",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_week),
              label: "Visitas",
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
  void telaInicial(){

  }
}