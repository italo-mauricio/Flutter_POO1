import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../assets/imagens.dart';

TextStyle _FontHeader = const TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.black);

TextStyle _FontNormalText = GoogleFonts.openSans(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
  color: Colors.black,
);

Widget estadioBarcelona() {
  return SingleChildScrollView(
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
    ),
  );
}
