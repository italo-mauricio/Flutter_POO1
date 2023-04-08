import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _FontHeader = const TextStyle(
    
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.black);

TextStyle _FontNormalText = GoogleFonts.openSans(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
  color: Colors.black,
);

Widget tabelaBarcelona() {
  final List<String> titulos = [
    "La Liga",
    "Copa del Rey",
    "Supercopa de España",
    "Liga dos Campeões da UEFA",
    "Supercopa da UEFA",
    "Copa Intercontinental"
  ];
  final List<int> anos = [1929, 1910, 1983, 1992, 1992, 2009];

  final List<String> Quantidade = ["26x", "31x", "14x", "5x", "5x", "4x"];

 return Column(
  children: [
    SizedBox(height: 20), // espaço entre o título e a tabela
    Text(
      'Ano dos Primeiros Títulos do Barcelona',
      style: _FontHeader,
    ),
    SizedBox(height: 20), // espaço entre o título e a tabela
    Padding(
      padding: EdgeInsets.symmetric(vertical: 10), // espaço acima e abaixo da tabela
      child: DataTable(
        columns: [
          DataColumn(
            label: Text(
              'Título',
              style: _FontNormalText,
            ),
          ),
          DataColumn(
            label: Text(
              'Ano',
              style: _FontNormalText,
            ),
          ),
          DataColumn(
            label: Text(
              'Quantidade',
              style: _FontNormalText,
            ),
          ),
        ],
        rows: [
          for (var i = 0; i < titulos.length; i++)
            DataRow(cells: [
              DataCell(
                Text(
                  titulos[i],
                  style: _FontNormalText,
                ),
              ),
              DataCell(
                Text(
                  anos[i].toString(),
                  style: _FontNormalText,
                ),
              ),
              DataCell(
                Text(
                  Quantidade[i].toString(),
                  style: _FontNormalText,
                ),
              )
            ]),
        ],
      ),
    ),
  ],
);
}
