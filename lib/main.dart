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
    setState(() {
      contador--;
    });
  }

  void increment() {
    setState(() {
      contador++;
    });
  }

  bool get isEmpty => contador <= 0;
  bool get isFull => contador == 50;
  bool get isAlmostFull => contador >= 40 && contador < 50;

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
                Text(
                  isFull
                      ? "Ambiente lotado!"
                      : isAlmostFull
                          ? "Quase lotado!"
                          : "Acesse o show",
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
                    //SAIU
                    TextButton(
                      onPressed: isEmpty ? null : decrement,

                      style: TextButton.styleFrom(
                        backgroundColor:
                            isEmpty
                                ? Colors.transparent
                                : Colors.white,

                        fixedSize: const Size(110, 42),
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),

                      child: Text(
                        "SAIU",
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color:
                              isEmpty
                                  ? Colors.white54
                                  : Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    //ENTROU
                    TextButton(
                      onPressed: isFull ? null : increment,
                      style: TextButton.styleFrom(
                        backgroundColor:
                            isFull
                                ? Colors.transparent
                                : Colors.white,

                        fixedSize: const Size(110, 42),
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),

                      child: Text(
                        "ENTROU",
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color:
                              isFull
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