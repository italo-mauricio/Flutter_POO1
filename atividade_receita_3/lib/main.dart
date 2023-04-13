import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: MyAppBar(),
          body: DataBodyWidget(objects: [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu"
          ]),
          bottomNavigationBar: NewNavBar(icons: [
            Icon(Icons.abc),
            Icon(Icons.ac_unit),
            Icon(Icons.access_alarm),
            Icon(Icons.accessibility)
          ]),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  List<Icon> icons;
  NewNavBar({this.icons = const []});

  void touchedButton(int index) {
    print("Touched: $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: touchedButton,
        items: icons
            .map((e) => BottomNavigationBarItem(icon: e, label: "Teste"))
            .toList());
  }
}

class DataBodyWidget extends StatelessWidget {
  List<String> objects;

  DataBodyWidget({this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: objects
            .map((obj) => Expanded(
                  child: Center(child: Text(obj)),
                ))
            .toList());
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dicas"),
      actions: [
        PopupMenuButton(
            onSelected: (value) {
              // TODO: Later add the color change functionality
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    value: Colors.black,
                    child: Text("Black"),
                  ),
                  PopupMenuItem(
                    value: Colors.amber,
                    child: Text("Amber"),
                  ),
                  PopupMenuItem(
                    value: Colors.cyan,
                    child: Text("Cyan"),
                  ),
                ])
      ],
    );
  }
}