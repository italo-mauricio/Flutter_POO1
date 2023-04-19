import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  MyApp app = const MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _backgroundColor = Colors.white;
  final List<String> _objects = [
    "La Fin Du Monde - Bock",
    "Sapporo Premiume - Sour Ale",
    "Duvel - Pilsner",
    "Guinness - Stout",
    "Heineken - Lager",
    "Budweiser - American Lager",
    "Corona - Pale Lager",
    "Stella Artois - Pilsner",
    "Becks - Pilsner",
    "Chimay - Trappist Ale",
    "Hoegaarden - Witbier",
    "Brahma - Pilsner",
    "Skol - American Lager",
    "Bavaria - Pilsner",
    "Bohemia - Pilsner",
    "Antarctica - American Lager",
    "Kaiser - Pilsner",
    "Original - Munich Helles",
    "Sagres - Lager",
    "Sul - Pilsner",
    "Norteña - Lager",
    "Baltika - Pilsner",
    "Brahma Extra - Pale Lager",
    "Quilmes - Lager",
    "Crystal - Pilsner",
    "Aguila - American Lager",
    "Polar - Pilsner",
    "Cusqueña - Pale Lager",
    "Club Colombia - Pilsner",
    "Bavaria - American Lager",
    "Presidente - Pilsner",
    "Victoria - Vienna Lager",
  ];

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar(onColorSelected: changeBackgroundColor),
        body: MyTileWidget(
          objects: _objects,
          backgroundColor: _backgroundColor,
        ),
        bottomNavigationBar: NewNavBar(
          icons: const [
            Icon(Icons.home),
            Icon(Icons.ac_unit),
            Icon(Icons.access_alarm),
            Icon(Icons.accessibility)
          ],
        ),
      ),
    );
  }
}


// ignore: must_be_immutable
class NewNavBar extends StatelessWidget {
  List<Icon> icons;
  NewNavBar({super.key, this.icons = const []});

  void touchedButton(int index) {
    if (kDebugMode) {
      print("Touched: $index");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: touchedButton,
      items: icons
          .map((e) => BottomNavigationBarItem(icon: e, label: "Teste"))
          .toList(),
    );
  }
}

class MyTileWidget extends StatelessWidget {
  final List<String> objects;
  final Color backgroundColor;

  const MyTileWidget({Key? key, required this.objects, required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView.builder(
        itemCount: objects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(objects[index]),
            subtitle: Text('IBU: ${(index + 1) * 10}'),
          );
        },
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final Function(Color) onColorSelected;

  const MyAppBar({super.key, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dicas"),
      centerTitle: true,
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            onColorSelected.call(value);
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: Colors.black,
              child: Text("Black"),
            ),
            const PopupMenuItem(
              value: Colors.amber,
              child: Text("Amber"),
            ),
            const PopupMenuItem(
              value: Colors.cyan,
              child: Text("Cyan"),
            ),
            const PopupMenuItem(
              value: Colors.white,
              child: Text("Default"),
            ),
          ],
        ),
      ],
    );
  }
}