

export 'package:flutter/material.dart';
export 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'cerveja.dart';
import 'tabelaBrasil.dart';
import 'autor.dart';


void Atividade1() {
  runApp(MyApp());
}

// fontes para usar no resto do código
TextStyle _FontHeader = GoogleFonts.openSans(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  color: Colors.black,
);

TextStyle _FontNormalText = GoogleFonts.openSans(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
  color: Colors.black,
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _Index = 0;
  final List<Widget> _pages = [
    Center(child: BeerTable()),
    Center(child: BeerTableBrasil()),
    Center(child: Text("teste")),
    Center(child: meuPerfil()),

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
            backgroundColor: Colors.amber,
            title: Text("Cervejas Pelo Mundo", style: _FontHeader),
            centerTitle: true,
          ),
          body: IndexedStack(
            index: _Index,
            children: _pages,
            
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(canvasColor: Colors.amber),
            child: BottomNavigationBar(
              currentIndex: _Index,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Ranking Geral",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grade),
                  label: "Brasileiras",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "História",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  label: "Perfil",
                ),
              ],
              onTap: _onItemTapped,
            ),
            
          ),
          
        ),
      );
    }
  }
