import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Container(
          color: Colors.amber,
          alignment: Alignment.center,
          child: Text("Olá, Turma!")
        )
      );
  } 
}

class HomePage extends StatelessWidget{
  const HomePage
}