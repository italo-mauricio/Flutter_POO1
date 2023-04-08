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
                  rows: const [
                    
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('La Fin Du Monde')),
                      DataCell(Text('Bock')),
                      DataCell(Text('65')),
                      DataCell(Text('Canadá')),
                      DataCell(Text('9% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Sapporo Premium')),
                      DataCell(Text('Sour Ale')),
                      DataCell(Text('54')),
                      DataCell(Text('Estados Unidos')),
                      DataCell(Text('4,9% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Duvel')),
                      DataCell(Text('Plisner')),
                      DataCell(Text('82')),
                      DataCell(Text('Bélgica')),
                      DataCell(Text('8,5% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Sierra Nevada Pale Ale')),
                      DataCell(Text('American Pale Ale')),
                      DataCell(Text('38')),
                      DataCell(Text('Estados Unidos')),
                      DataCell(Text('5,6% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Guinness Draught')),
                      DataCell(Text('Irish Dry Stout')),
                      DataCell(Text('45')),
                      DataCell(Text('Irlanda')),
                      DataCell(Text('4,1% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Samuel Adams Boston Lager')),
                      DataCell(Text('Vienna Lager')),
                      DataCell(Text('30')),
                      DataCell(Text('Estados Unidos')),
                      DataCell(Text('5,0% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('La Fin Du Monde')),
                      DataCell(Text('Belgian Tripel ')),
                      DataCell(Text('19')),
                      DataCell(Text('Canadá')),
                      DataCell(Text('9,0% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Miller Lite')),
                      DataCell(Text('American Light Lager')),
                      DataCell(Text('10')),
                      DataCell(Text('Estados Unidos')),
                      DataCell(Text('5,0% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Rogue Dead Guy Ale')),
                      DataCell(Text('Maibock')),
                      DataCell(Text('40')),
                      DataCell(Text('Estados Unidos')),
                      DataCell(Text('6,6% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Pilsner Urquell')),
                      DataCell(Text('Czech Pilsner')),
                      DataCell(Text('40')),
                      DataCell(Text('República Tcheca')),
                      DataCell(Text('4,4% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Paulaner')),
                      DataCell(Text('Munich Helles Lager')),
                      DataCell(Text('18')),
                      DataCell(Text('Alemanha')),
                      DataCell(Text('5,5% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Heineken')),
                      DataCell(Text('International Pale Lager')),
                      DataCell(Text('23')),
                      DataCell(Text('Holanda')),
                      DataCell(Text('4,5% de álcool')),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Skoll')),
                      DataCell(Text('Lager')),
                      DataCell(Text('23')),
                      DataCell(Text('Brasil')),
                      DataCell(Text('4,5% de álcool')),
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
