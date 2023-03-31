import 'package:flutter/material.dart';



void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
          appBar: AppBar(title: Text("Hello World")),
          body: Center(
              child: Column(children: [
            Text("Viva o Messi"),
            Text("Viva carlinhos bala"),
            Text("Viva alef manga"),
            Text("Olá mundo")
          ])),
          bottomNavigationBar: Text("italo")));
         
  runApp(app);
}
