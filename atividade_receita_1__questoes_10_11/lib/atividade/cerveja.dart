import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

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

void projeto2() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Cervejas pelo Mundo',
                style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.amber,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            scrollDirection: Axis.vertical,
            child: Center(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: DataTable(
                  dataRowHeight: 50.0, //
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Nome',
                        style: _FontHeader,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Estilo',
                        style: _FontHeader,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'IBU',
                        style: _FontHeader,
                      ),
                    ),
                    DataColumn(
                        label: Text(
                      'Local de fabricação',
                      style: _FontHeader,
                    )),
                    DataColumn(
                        label: Text(
                      'Teor alcoólico',
                      style: _FontHeader,
                    )),
                  ],
                  rows: [
                    
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('La Fin Du Monde', style: _FontNormalText)),
                      DataCell(Text('Bock', style: _FontNormalText)),
                      DataCell(Text('65', style: _FontNormalText)),
                      DataCell(Text('Canadá', style: _FontNormalText)),
                      DataCell(Text('9% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Sapporo Premium', style: _FontNormalText)),
                      DataCell(Text('Sour Ale', style: _FontNormalText)),
                      DataCell(Text('54', style: _FontNormalText)),
                      DataCell(Text('Estados Unidos', style: _FontNormalText)),
                      DataCell(Text('4,9% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Duvel', style: _FontNormalText)),
                      DataCell(Text('Plisner', style: _FontNormalText)),
                      DataCell(Text('82', style: _FontNormalText)),
                      DataCell(Text('Bélgica', style: _FontNormalText)),
                      DataCell(Text('8,5% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Sierra Nevada Pale Ale', style: _FontNormalText)),
                      DataCell(Text('American Pale Ale', style: _FontNormalText)),
                      DataCell(Text('38', style: _FontNormalText)),
                      DataCell(Text('Estados Unidos', style: _FontNormalText)),
                      DataCell(Text('5,6% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Guinness Draught', style: _FontNormalText)),
                      DataCell(Text('Irish Dry Stout', style: _FontNormalText)),
                      DataCell(Text('45', style: _FontNormalText)),
                      DataCell(Text('Irlanda', style: _FontNormalText)),
                      DataCell(Text('4,1% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Samuel Adams Boston Lager', style: _FontNormalText)),
                      DataCell(Text('Vienna Lager', style: _FontNormalText)),
                      DataCell(Text('30', style: _FontNormalText)),
                      DataCell(Text('Estados Unidos', style: _FontNormalText)),
                      DataCell(Text('5,0% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('La Fin Du Monde', style: _FontNormalText)),
                      DataCell(Text('Belgian Tripel', style: _FontNormalText)),
                      DataCell(Text('19', style: _FontNormalText)),
                      DataCell(Text('Canadá', style: _FontNormalText)),
                      DataCell(Text('9,0% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Miller Lite', style: _FontNormalText)),
                      DataCell(Text('American Light Lager', style: _FontNormalText)),
                      DataCell(Text('10', style: _FontNormalText)),
                      DataCell(Text('Estados Unidos', style: _FontNormalText)),
                      DataCell(Text('5,0% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Rogue Dead Guy Ale', style: _FontNormalText)),
                      DataCell(Text('Maibock', style: _FontNormalText)),
                      DataCell(Text('40', style: _FontNormalText)),
                      DataCell(Text('Estados Unidos', style: _FontNormalText)),
                      DataCell(Text('6,6% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Pilsner Urquell', style: _FontNormalText)),
                      DataCell(Text('Czech Pilsner', style: _FontNormalText)),
                      DataCell(Text('40', style: _FontNormalText)),
                      DataCell(Text('República Tcheca',style: _FontNormalText)),
                      DataCell(Text('4,4% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Paulaner', style: _FontNormalText)),
                      DataCell(Text('Munich Helles Lager', style: _FontNormalText)),
                      DataCell(Text('18', style: _FontNormalText)),
                      DataCell(Text('Alemanha', style: _FontNormalText)),
                      DataCell(Text('5,5% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Heineken', style: _FontNormalText)),
                      DataCell(Text('International Pale Lager', style: _FontNormalText)),
                      DataCell(Text('23', style: _FontNormalText)),
                      DataCell(Text('Holanda', style: _FontNormalText)),
                      DataCell(Text('4,5% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Skoll', style: _FontNormalText)),
                      DataCell(Text('Lager', style: _FontNormalText)),
                      DataCell(Text('23', style: _FontNormalText)),
                      DataCell(Text('Brasil', style: _FontNormalText)),
                      DataCell(Text('4,5% de álcool', style: _FontNormalText)),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
