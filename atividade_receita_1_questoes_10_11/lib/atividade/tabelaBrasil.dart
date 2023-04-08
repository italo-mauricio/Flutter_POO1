import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeerTableBrasil extends StatelessWidget {
  final TextStyle _fontHeader = GoogleFonts.openSans(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  final TextStyle _FontNormalText = GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      scrollDirection: Axis.vertical,
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: DataTable(
            dataRowHeight: 50.0,
            columns: <DataColumn>[
              DataColumn(
                label: Text(
                  'Nome',
                  style: _fontHeader,
                ),
              ),
              DataColumn(
                label: Text(
                  'Estilo',
                  style: _fontHeader,
                ),
              ),
              DataColumn(
                label: Text(
                  'IBU',
                  style: _fontHeader,
                ),
              ),
              DataColumn(
                  label: Text(
                'Local de fabricação',
                style: _fontHeader,
              )),
              DataColumn(
                  label: Text(
                'Teor alcoólico',
                style: _fontHeader,
              )),
            ],
            rows: [
              DataRow(selected: true, cells: [
                DataCell(Text('Wäls Dubbel', style: _FontNormalText)),
                DataCell(Text('Belgian Dubbel', style: _FontNormalText)),
                DataCell(Text('26', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('7,5% de álcool', style: _FontNormalText)),
              ]),
                DataRow(selected: true, cells: [
                DataCell(Text('BodeBrown', style: _FontNormalText)),
                DataCell(Text('Imperial IPA', style: _FontNormalText)),
                DataCell(Text('45', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('9,2% de álcool', style: _FontNormalText)),
              ]),
                DataRow(selected: true, cells: [
                DataCell(Text('Way American Pale Alel', style: _FontNormalText)),
                DataCell(Text('Dry Hopping', style: _FontNormalText)),
                DataCell(Text('31', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('5,2% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Skol', style: _FontNormalText)),
                DataCell(Text('Lager', style: _FontNormalText)),
                DataCell(Text('11', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('4,4% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Schin', style: _FontNormalText)),
                DataCell(Text('Lager', style: _FontNormalText)),
                DataCell(Text('7', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('4,7% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Brahma', style: _FontNormalText)),
                DataCell(Text('Premium American', style: _FontNormalText)),
                DataCell(Text('13', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('5,5% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Itaipava', style: _FontNormalText)),
                DataCell(Text('American Lager', style: _FontNormalText)),
                DataCell(Text('9,5', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('4,0% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Colorado Indica', style: _FontNormalText)),
                DataCell(Text('India Pale Ale', style: _FontNormalText)),
                DataCell(Text('45', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('7,0% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Tupiniquim Monjolo', style: _FontNormalText)),
                DataCell(Text('Imperial Porter', style: _FontNormalText)),
                DataCell(Text('35', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('10,5% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Invicta 1000 IBU', style: _FontNormalText)),
                DataCell(Text('Imperial IPA', style: _FontNormalText)),
                DataCell(Text('1000', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('8,0% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Antartica', style: _FontNormalText)),
                DataCell(Text('Pilsen', style: _FontNormalText)),
                DataCell(Text('9', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('4,7% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Kaiser', style: _FontNormalText)),
                DataCell(Text('Lager', style: _FontNormalText)),
                DataCell(Text('40', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('4,5% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Colorado Demoiselle', style: _FontNormalText)),
                DataCell(Text('Robust Porter', style: _FontNormalText)),
                DataCell(Text('22', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('6,0% de álcool', style: _FontNormalText)),
              ]),
              DataRow(selected: true, cells: [
                DataCell(Text('Schornstein Imperial Stout ', style: _FontNormalText)),
                DataCell(Text('Imperial Sout', style: _FontNormalText)),
                DataCell(Text('70', style: _FontNormalText)),
                DataCell(Text('Brasil', style: _FontNormalText)),
                DataCell(Text('8,0% de álcool', style: _FontNormalText)),
              ]),
              
    
            ],
          ),
        ),
      ),
    );
  }
}
