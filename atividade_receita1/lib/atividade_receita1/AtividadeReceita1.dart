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
  // adiciona aqui os widgets que deseja exibir em cada página
  LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              const Text(
                "Lionel Messi é um dos jogadores mais icônicos e talentosos do futebol mundial. Desde sua infância na Argentina, Messi sempre demonstrou um talento excepcional para o esporte, e aos 13 anos de idade, ele se mudou para Barcelona para se juntar às categorias de base do time local. Ao longo dos anos, Messi se estabeleceu como uma lenda do Barcelona, ​​vencendo inúmeras competições e prêmios individuais. Seu talento e habilidade inigualáveis ​​fizeram dele um dos maiores jogadores de todos os tempos.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16), 
              ), Image.network('https://www.otempo.com.br/image/contentid/policy:1.1949890:1531768523/image-image-jpg.jpg?f=3x2&w=1224'),  
            ],
          ),
        ),
      );
    },
  ),
  const Center(child: Text("Pesquisar")),
  const Center(child: Text("Favoritos")),
  const Center(child: Text("Localização")),
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  
      textTheme: const TextTheme(
        bodyText2: TextStyle(fontFamily: 'Open Sans'),
      ),
    ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("Barcelona Legend",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold,)),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _Index,
          children: _pages,
        ),
        bottomNavigationBar: Theme(data:ThemeData(
          canvasColor: Colors.redAccent
        ), 
        child:BottomNavigationBar(
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
    )); 
       
  }
  void telaInicial(){

  }
  void pesquisar(){

  }
 
}