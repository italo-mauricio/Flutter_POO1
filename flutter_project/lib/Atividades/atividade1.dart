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
    Center(child: Text("Página Inicial")),
    Center(child: Text("Pesquisar")),
    Center(child: Text("Favoritos")),
    Center(child: Text("Localização")),
    Center(child: Text("Meu Perfil")),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _Index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.amber,
      textTheme: const TextTheme(
        bodyText2: TextStyle(fontFamily: 'Open Sans'),
      ),
    ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cervejas",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _Index,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.amber,
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
              label: "Pesquisar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: "Localização",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Perfil",
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
  void telaInicial(){

  }
  void pesquisar(){

  }
 
}