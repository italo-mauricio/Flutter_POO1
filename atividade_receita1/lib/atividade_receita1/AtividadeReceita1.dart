import 'teste.dart';


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
          placeholder:
              NetworkImage('https://pbs.twimg.com/media/Fs0BPfGWwAI39Pi.png'),
          image: imageBarcaLogo,
          height: 300, // Altura da imagem em pixels
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
      children: <Widget>[
        Text(
          "Lionel Messi\n",
          style: _FontHeader,
          textAlign: TextAlign.center,
        ),
        const FadeInImage(
          placeholder:
              NetworkImage('https://pbs.twimg.com/media/Fs0BPfGWwAI39Pi.png'),
          image: imageMessi,
          height: 400, // Altura da imagem em pixels
        ),
        SizedBox(height: 16.0),
        Text(
          "Lionel Messi é um dos maiores jogadores de futebol da história e sua história no Barcelona é uma das mais emblemáticas do esporte. Nascido em Rosário, Argentina, Messi mudou-se para a Espanha ainda criança para jogar nas categorias de base do Barcelona.",
          style: _FontNormalText,
        ),
        SizedBox(height: 16.0),
        Text(
            "Com apenas 17 anos, ele fez sua estreia na equipe principal em um amistoso contra o Porto em 2003. Foi o início de uma trajetória incrível que o levaria a se tornar o maior artilheiro da história do clube, além de conquistar inúmeros títulos e prêmios individuais.",
            style: _FontNormalText),
        SizedBox(height: 16.0),
        Text(
          "Nos primeiros anos, Messi formou uma parceria lendária com Ronaldinho Gaúcho, que o ajudou a se adaptar ao futebol europeu e a se tornar um dos jogadores mais temidos do mundo. Juntos, eles conquistaram a Liga dos Campeões da UEFA em 2006, além de dois títulos espanhóis.",
          style: _FontNormalText,
        ),
        SizedBox(height: 16.0),
        Text(
          "Mas foi na temporada 2008/2009 que Messi se estabeleceu como o principal jogador do Barcelona. Ele marcou 38 gols em 51 jogos, liderando o time para a conquista da Liga dos Campeões, da La Liga e da Copa del Rey. Foi a primeira vez na história que um clube espanhol conquistou a tríplice coroa.",
          style: _FontNormalText,
        ),
        SizedBox(height: 16.0),
        Text(
            "A partir daí, Messi se tornou um sinônimo do sucesso do Barcelona, conquistando mais títulos e prêmios individuais do que se pode contar. Ele ganhou a Liga dos Campeões mais três vezes, a La Liga dez vezes e a Copa del Rey sete vezes, além de ter sido eleito o melhor jogador do mundo seis vezes.",
            style: _FontNormalText),
        SizedBox(height: 16.0),
        Text(
            "Mas o sucesso de Messi no Barcelona não foi apenas uma questão de estatísticas e títulos. Ele se tornou um símbolo do clube e da cidade, inspirando uma geração de fãs de futebol com sua habilidade, humildade e devoção ao jogo.",
            style: _FontNormalText),
        SizedBox(height: 16.0),
        Text(
            "Mesmo quando enfrentou momentos difíceis, como as derrotas na Liga dos Campeões de 2010 e 2012, Messi nunca deixou de ser um líder e um exemplo para seus companheiros de equipe e para os torcedores do Barcelona.",
            style: _FontNormalText),
        SizedBox(height: 16.0),
        Text(
            "Em 2021, depois de 20 anos de história no Barcelona, Messi decidiu deixar o clube para buscar novos desafios. Sua saída deixou muitos fãs tristes, mas sua história no clube sempre será lembrada como uma das mais bonitas e emocionantes da história do futebol.",
            style: _FontNormalText)
      ],
    ),
  )
);


Widget _EstadioBarcelona = SingleChildScrollView(
    child: Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      children: <Widget>[
        Text(
          "Camp Nou\n",
          style: _FontHeader,
          textAlign: TextAlign.center,
        ),
        const FadeInImage(
          placeholder:
              NetworkImage('https://pbs.twimg.com/media/Fs0BPfGWwAI39Pi.png'),
          image: imageCampNou,
          height: 400, // Altura da imagem em pixels
        ),
        SizedBox(height: 16.0),
        Text(
          "O Camp Nou é um dos estádios mais famosos e icônicos do mundo do futebol, sendo a casa do Barcelona, um dos clubes mais prestigiados e bem-sucedidos do mundo. Localizado na cidade de Barcelona, na Espanha, o Camp Nou é o maior estádio da Europa e o terceiro maior do mundo em capacidade, com uma capacidade de mais de 99 mil espectadores.",
          style: _FontNormalText,
        ),
        SizedBox(height: 16.0),
        Text(
            "O Camp Nou foi inaugurado em 1957, com um jogo amistoso entre o Barcelona e uma equipe polonesa. Desde então, o estádio passou por várias reformas e melhorias para acomodar o crescente número de fãs e melhorar a experiência do público. Além disso, o estádio tem sido palco de inúmeros eventos esportivos de grande porte, incluindo partidas da seleção espanhola de futebol e finais da Liga dos Campeões da UEFA.",
            style: _FontNormalText),
        SizedBox(height: 16.0),
        Text(
          "Uma das características mais notáveis do Camp Nou é o seu design único e distinto, com um teto curvo e um design em forma de tigela que permite que os espectadores fiquem mais próximos da ação no campo. O estádio também é conhecido por sua acústica excelente, que cria uma atmosfera vibrante e emocionante durante as partidas.",
          style: _FontNormalText,
        ),
        SizedBox(height: 16.0),
        Text(
          "Além de ser a casa do Barcelona, o Camp Nou também é um destino popular para visitantes de todo o mundo. O estádio oferece uma variedade de passeios e experiências, incluindo visitas guiadas aos bastidores, museus interativos e uma loja oficial do clube, onde os fãs podem comprar souvenirs e produtos exclusivos do Barcelona.",
          style: _FontNormalText,
        ),
        SizedBox(height: 16.0),
        Text(
            "Em resumo, o Camp Nou é um ícone do mundo do futebol, com uma história rica e uma atmosfera única que atrai fãs e visitantes de todo o mundo. Com sua capacidade impressionante, design icônico e história lendária, o Camp Nou é verdadeiramente um dos estádios mais impressionantes do mundo.",
            style: _FontNormalText),
      ],
    ),
  )
);




class _MyAppState extends State<MyApp> {
  int _Index = 0;
  final List<Widget> _pages = [

    Center(child: _historiaBarca,),
    Center(child: _lionelMessi),
    Center(child: _EstadioBarcelona),
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
