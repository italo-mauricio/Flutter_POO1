import 'table/tabela.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, import_of_legacy_library_into_null_safe
import 'dart:math' as math;
import 'assets/imagens.dart';
import 'content/messi.dart';
import 'content/barcelona.dart';
import 'content/campNou.dart';

// ignore: non_constant_identifier_names
void Atividade1() {
  runApp(MyApp());
}

// fontes para usar no resto do código
TextStyle _FontHeader = const TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.black);

TextStyle _FontNormalText = const TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
    fontSize: 20,
    color: Colors.black);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _Index = 0;
  final List<Widget> _pages = [
    Center(child: barcelonaHomePage()),
    Center(child: lionelMessi()),
    Center(child: estadioBarcelona()),
    Center(child: tabelaBarcelona()),
    const Center(child: Text("Meu Perfil")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _Index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:
            false, // desabilitando o "debug" no canto da tela
        theme: ThemeData(colorScheme: const ColorScheme.light()),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text("Barcelona Fútbol Club", style: _FontHeader),
            centerTitle: true,
          ),
          body: IndexedStack(
            index: _Index,
            children: _pages,
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(canvasColor: Colors.redAccent),
            child: BottomNavigationBar(
              currentIndex: _Index,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.amber,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Inicial",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grade),
                  label: "Lionel Messi",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Camp Nou",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_events),
                  label: "Títulos",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  label: "Perfil",
                ),
              ],
              onTap: _onItemTapped,
            ),
          ),
        ));
  }
}
