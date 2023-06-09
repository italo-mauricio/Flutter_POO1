import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeerTable extends StatelessWidget {
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
                      DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('La Fin Du Monde', style: _FontNormalText)),
                      DataCell(Text('Bock', style: _FontNormalText)),
                      DataCell(Text('65', style: _FontNormalText)),
                      DataCell(Text('Canadá', style: _FontNormalText)),
                      DataCell(Text('9,0% de álcool', style: _FontNormalText)),
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
                      DataCell(Text('Skol', style: _FontNormalText)),
                      DataCell(Text('Lager', style: _FontNormalText)),
                      DataCell(Text('11', style: _FontNormalText)),
                      DataCell(Text('Brasil', style: _FontNormalText)),
                      DataCell(Text('4,4% de álcool', style: _FontNormalText)),
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
                      DataCell(Text('Schin', style: _FontNormalText)),
                      DataCell(Text('Lager', style: _FontNormalText)),
                      DataCell(Text('7', style: _FontNormalText)),
                      DataCell(Text('Brasil', style: _FontNormalText)),
                      DataCell(Text('4,7% de álcool', style: _FontNormalText)),
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
                      DataCell(Text('Brahma', style: _FontNormalText)),
                      DataCell(Text('Premium American', style: _FontNormalText)),
                      DataCell(Text('13', style: _FontNormalText)),
                      DataCell(Text('Brasil', style: _FontNormalText)),
                      DataCell(Text('5,5% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Itaipava', style: _FontNormalText)),
                      DataCell(Text('American Lager', style: _FontNormalText)),
                      DataCell(Text('9,5', style: _FontNormalText)),
                      DataCell(Text('Brasil', style: _FontNormalText)),
                      DataCell(Text('4,0% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Amstel', style: _FontNormalText)),
                      DataCell(Text('Lager', style: _FontNormalText)),
                      DataCell(Text('11', style: _FontNormalText)),
                      DataCell(Text('Holanda', style: _FontNormalText)),
                      DataCell(Text('4,6% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Colorado Indica', style: _FontNormalText)),
                      DataCell(Text('India Pale Ale', style: _FontNormalText)),
                      DataCell(Text('45', style: _FontNormalText)),
                      DataCell(Text('Brasil', style: _FontNormalText)),
                      DataCell(Text('7,0% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Tsingtao', style: _FontNormalText)),
                      DataCell(Text('Light', style: _FontNormalText)),
                      DataCell(Text('23', style: _FontNormalText)),
                      DataCell(Text('China', style: _FontNormalText)),
                      DataCell(Text('4,5% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Tupiniquim Monjolo', style: _FontNormalText)),
                      DataCell(Text('Imperial Porter', style: _FontNormalText)),
                      DataCell(Text('35', style: _FontNormalText)),
                      DataCell(Text('Brasil', style: _FontNormalText)),
                      DataCell(Text('10,5% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Westvleteren', style: _FontNormalText)),
                      DataCell(Text('Belgian Specialty Ale', style: _FontNormalText)),
                      DataCell(Text('41', style: _FontNormalText)),
                      DataCell(Text('Bélgica', style: _FontNormalText)),
                      DataCell(Text('5,8% de álcool', style: _FontNormalText)),
                    ]),
                    DataRow(
                      selected: true,
                      cells: [
                      DataCell(Text('Chimay Grande Reserve', style: _FontNormalText)),
                      DataCell(Text('Belgian Dark Strong Ale', style: _FontNormalText)),
                      DataCell(Text('41', style: _FontNormalText)),
                      DataCell(Text('Bélgica', style: _FontNormalText)),
                      DataCell(Text('9,0% de álcool', style: _FontNormalText)),
                    ]),
            ],
          ),
        ),
      ),
    );
  }
}