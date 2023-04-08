import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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

Widget historiaCerveja() {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            "A cerveja é uma das bebidas mais populares do mundo, consumida em praticamente todos os países e culturas. Sua origem remonta há milhares de anos, quando o homem começou a cultivar grãos e descobriu que a fermentação poderia produzir uma bebida alcoólica.\nOs primeiros vestígios da produção de cerveja datam de aproximadamente 5.000 a.C. na antiga Mesopotâmia, região que hoje compreende o Iraque e o Kuwait. Naquela época, a cerveja era feita com cevada e outros cereais fermentados, e era considerada uma bebida sagrada, utilizada em cerimônias religiosas.\nCom o tempo, a produção de cerveja se espalhou pelo mundo, e cada cultura desenvolveu suas próprias técnicas e receitas. No Egito Antigo, a cerveja era feita com pão fermentado e mel, enquanto na Europa Medieval, a bebida era produzida com cevada e lúpulo.\nNo século XIX, a cerveja se tornou uma bebida industrializada, produzida em larga escala por fábricas e vendida em todo o mundo. O surgimento de novas tecnologias de produção permitiu a criação de diversos estilos de cerveja, como a Pilsen, a Ale e a Stout.\nHoje, a cerveja é uma das bebidas mais consumidas no mundo, e existem milhares de marcas e estilos diferentes. De cervejas leves e refrescantes a cervejas escuras e encorpadas, há opções para todos os gostos e ocasiões.\nAlém de ser uma bebida apreciada por muitos, a cerveja também tem um papel importante na cultura e na história de muitos países. Na Alemanha, por exemplo, a cerveja é considerada uma parte fundamental da cultura local, e é consumida em festas e celebrações durante todo o ano.\nEm resumo, a história da cerveja é longa e rica, e continua evoluindo até os dias de hoje. Seja para relaxar após um longo dia de trabalho ou para celebrar uma ocasião especial, a cerveja é uma bebida que sempre terá um lugar especial no coração das pessoas ao redor do mundo.",
            style: _FontNormalText,
            textAlign: TextAlign.center,
          ),  
        ],
      ),
    ),
  );
}
