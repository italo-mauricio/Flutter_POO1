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
        body: DataBodyWidget(
          objects: const [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu"
          ],
          backgroundColor: _backgroundColor,
        ),
        bottomNavigationBar: NewNavBar(
          icons: const [
            Icon(Icons.abc),
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

class DataBodyWidget extends StatelessWidget {
  final List<String> objects;
  final Color backgroundColor;

  const DataBodyWidget({super.key, this.objects = const [], required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: objects
            .map(
              (obj) => Expanded(
                child: Center(
                  child: Text(obj),
                ),
              ),
            )
            .toList(),
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
          ],
        ),
      ],
    );
  }
}