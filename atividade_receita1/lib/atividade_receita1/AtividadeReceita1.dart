import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, import_of_legacy_library_into_null_safe
import 'dart:math' as math;

import 'assets/imagens.dart';

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



Widget _historiaBarca = SingleChildScrollView(
  child: Container(
    padding: const EdgeInsets.all(
        16.0), // Adiciona um padding de 16.0 em todas as direções
    child: Column(
      children: <Widget>[
        const FadeInImage(
        placeholder: NetworkImage('https://pbs.twimg.com/media/Fs0BPfGWwAI39Pi.png'),
        image: imageBarcaLogo,
        height: 200, // Altura da imagem em pixels
      ),
        const SizedBox(height: 16.0),
        Text(
          'Em 1899, Joan Gamper, um suíço, decidiu introduzir o futebol em Barcelona, montando um time. O clube foi oficialmente fundado no dia 29 de novembro de 1899.',
          style: _FontNormalText,
        ),
        const SizedBox(height: 16.0),
        Text(
          'Cresceu cada vez mais, ganhando títulos como a Copa Macaya em 1902, a Copa Pirineus em 1910 - 1912. Durante a década de 1920, a fama e o sucesso do time aumentou. Eles ganharam o primeiro Campeonato da Liga na temporada de 1928 - 1929. Com a nova popularidade do clube, foi necessário construir um novo estádio. Em 1922, o estádio ‘Les Corts’ foi construído, com capacidade para 22.000 pessoas.',
          style: _FontNormalText,
        ),
        const SizedBox(height: 16.0),
        Text(
          'É importante lembrar que o Barcelona FC sobreviveu à Guerra Civil. Em 1936, as tropas de Franco atiraram no presidente do clube, Josep Sunyol, devido à sua filiação a um partido de esquerda.',
          style: _FontNormalText,
        ),
        const SizedBox(height: 16.0),
        Text(
          ' Todos os fãs do Barcelona FC se orgulham do que é chamado de Temporada de ‘Cinco Copas’. Este foi o período entre 1951 - 1952, quando o Barcelona FC venceu a Copa, a Liga, a Copa América, o Martini Rosso e o Eva Duarte.',
          style: _FontNormalText,
        ),
        const SizedBox(height: 16.0),
        Text(
          ' Em 1996 - 97, duas novas chegadas ao time tiveram um efeito estimulante: Bobby Robson, no banco, e Ronaldo, no gramado. Este foi um ano bem sucedido para o time.',
          style: _FontNormalText,
        ),
        const SizedBox(height: 16.0),
        Text(
          ' Em 2003, uma nova leva de jogadores se juntou ao time. Isso incluiu Rijkaard e Ronaldinho, Puyol e Xavi. Em 2004 - 2005, jogadores como Deco e Etoo se juntaram ao time.Na temporada de 2004 - 2005, o Barcelona FC ganhou a Liga. Isso aconteceu novamente em 2005 - 2006, quando o clube ganhou a Liga novamente e a Copa Europeia em Paris.',
          style: _FontNormalText,
        ),
        const SizedBox(height: 16.0),
        RichText(text: TextSpan(text: "Barcelona Atual", style: _FontHeader)),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'Uma coisa que torna o Barcelona FC verdadeiramente único é seu status de ‘Clube de Futebol’. É um dos poucos times restantes que não é uma sociedade limitada. Isto significa que o clube é ainda de propriedade de seus membros: há 144 mil deles. Esses membros também escolhem o Presidente do time através de um complexo sistema de votação',
          style: _FontNormalText,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'O Barcelona atualmente (em 2023) vive em uma crise financeira, porém o clube com a nova gestão, visa reerguer o clube financeiramente e midiaticamente. Já que alguns vexames em campo e juridicamente, acabaram prejudicando fortemente o clube. A crise começou na gestão antiga, sendo a mesma acusada de corrupção, com decisões que agravaram a situação financeira do clube.',
          style: _FontNormalText,
        ),
        const SizedBox(height: 16.0),
        Text(
          'Porém, a nova gestão está fazendo um ótimo trabalho, reergendo o clube, fazendo acordos financeiros, pagando dívidas e trabalhando para retomar os momentos de glórias do passado do clube.',
          style: _FontNormalText,
        )
      ],
    ),
  ),
);


Widget _lionelMessi = SingleChildScrollView(
    child: Container(
  padding: EdgeInsets.all(16.0),
  child: Column(
    children: const <Widget>[
      FadeInImage(
        placeholder: NetworkImage('https://pbs.twimg.com/media/Fs0BPfGWwAI39Pi.png'),
        image: imageMessi,
        height: 200, // Altura da imagem em pixels
      ),
      SizedBox(height: 16.0),
      Text("dsadasdsd")
    ],
  ),
));

class _MyAppState extends State<MyApp> {
  int _Index = 0;
  final List<Widget> _pages = [
    Center(
      child: _historiaBarca,
    ),
    Center(child: _lionelMessi),
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
