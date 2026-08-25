import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage()
    );
  } 
}

class HomePage extends StatelessWidget{
  //const HomePage(Key? key):super(key:key);
  void decrement(){
    print("Decrementando...");
  }

  void increment(){
    print("Incrementando...");
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,//Alinhado no eixo da vertical
        children: [
          Text("Pode Entrar!",
              style:
                TextStyle(
                  fontSize: 26,
                  color:Colors.white,
                  fontWeight: FontWeight.w700
                )
          ),
          Text("0",
            style: 
              TextStyle(
                fontSize: 100,
                color:Colors.white
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: decrement,child:
                Text("Saiu",
                  style:TextStyle(
                  fontSize:16,
                  color: Colors.black
              ))),
              TextButton(onPressed: increment,child:Text("Entrou",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                  ),  
              ))
            ],
          )
        ],
      )
    );
  }
}




