import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
    theme: ThemeData(primarySwatch: Colors.purple),
    home: Scaffold(
      appBar: AppBar(title: Text("Hello World")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Viva o Messi"),
            Text("Viva carlinhos bala"),
            Text("Viva alef manga"),
            Text("Olá mundo"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "person",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball),
            label: "sports_basketball",
          ),
        ],
      ),
    ),
  );

  runApp(app);
}
