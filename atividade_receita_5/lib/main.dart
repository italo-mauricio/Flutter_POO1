import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

var dataObjects = [];


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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dicas", style: _FontHeader,),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            DataTableWidget(jsonObjects: dataObjects),
          ],
        ),
        bottomNavigationBar: NewNavBar(),
      ),
    );
  }
}

class NewNavBar extends HookWidget {
  NewNavBar();

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
      backgroundColor: Colors.amber,
      onTap: (index) {
        state.value = index;
      },
      currentIndex: state.value,
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined, color: Colors.black),
        ),
        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined, color: Colors.red),
        ),
        BottomNavigationBarItem(
          label: "Nações",
          icon: Icon(Icons.flag_circle_outlined, color: Colors.blue),
        ),
      ],
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  DataTableWidget({this.jsonObjects = const []});

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome", "Estilo", "IBU"];
    var propertyNames = ["name", "style", "ibu"];

    return DataTable(
      columns: columnNames
          .map(
            (name) => DataColumn(
              label: Expanded(
                child: Text(
                  name,
                  style:_FontNormalText,
                ),
              ),
            ),
          )
          .toList(),
      rows: jsonObjects
          .map(
            (obj) => DataRow(
              cells: propertyNames
                  .map(
                    (propName) => DataCell(
                      Text(obj[propName]),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}
