import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int contador = 0;
  
  void decrement() {
    if (contador > 0) {
      setState(() {
        contador--;
      });
    }
  }
  
  void increment() {
    if (contador < 50) {
      setState(() {
        contador++;
      });
    }
  }

  // MENSAGENS DE LOTAÇÃO
  String mensagemLotacao() {
    if (contador == 50) {
      return "Ambiente lotado!";
    } else if (contador >= 40) {
      return "Quase lotado!";
    } else {
      return "Acesse o show";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/img/logo_bg.png',
          height: 40,
        ),

        // BOTÃO DE RESET
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                contador = 0;
              });
            },
            color: Colors.white,
            icon: const Icon(Icons.refresh),
          ),
        ],

        backgroundColor: const Color.fromARGB(255,34,34,34,),
        centerTitle: true,
      ),

      body: Stack(
        children: [          
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/img/creed_bg.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
       
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MENSAGEM
                Text(
                  mensagemLotacao(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1,
                  ),
                ),
                
                Text(
                  contador.toString(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 100,
                    color: Colors.white,
                    letterSpacing: -2,
                  ),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // BOTÃO SAIU
                    OutlinedButton(
                      onPressed: contador == 0 ? null : decrement,

                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            contador == 0
                                ? Colors.transparent
                                : Colors.white,

                        side: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),

                        fixedSize: const Size(110, 42),
                        padding: EdgeInsets.zero,
                      ),

                      child: Text(
                        "SAIU",
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                          color:
                              contador == 0
                                  ? Colors.white54
                                  : Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // BOTÃO ENTROU
                    OutlinedButton(
                      onPressed: contador == 50 ? null : increment,

                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            contador == 50
                                ? Colors.transparent
                                : Colors.white,

                        side: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),

                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),

                        fixedSize: const Size(110, 42),
                        padding: EdgeInsets.zero,
                      ),

                      child: Text(
                        "ENTROU",
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                          color:
                              contador == 50
                                  ? Colors.white54
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 