import 'package:flutter/material.dart';


Widget tabelaBarcelona() {
  final List<String> titulos = [
    "La Liga",
    "Copa del Rey",
    "Supercopa de España",
    "Liga dos Campeões da UEFA",
    "Supercopa da UEFA",
    "Copa Intercontinental"
  ];

  final List<int> anos = [
    1929,
    1910,
    1983,
    1992,
    1992,
    2009
  ];

  return DataTable(
    columns: [
      DataColumn(label: Text('Título')),
      DataColumn(label: Text('Ano')),
    ],
    rows: [
      for (var i = 0; i < titulos.length; i++)
        DataRow(cells: [
          DataCell(Text(titulos[i])),
          DataCell(Text(anos[i].toString())),
        ])
    ],
    
  );
}
