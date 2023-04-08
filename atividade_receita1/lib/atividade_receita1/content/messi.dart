import 'package:flutter/material.dart';

import '../assets/imagens.dart';

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

Widget lionelMessi() {
  return SingleChildScrollView(
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
    ),
  );
}
