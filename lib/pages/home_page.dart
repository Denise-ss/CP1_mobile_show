
import 'package:flutter/material.dart';
import 'package:projeto_cont_fiap/models/pessoa.dart';
import 'package:projeto_cont_fiap/widgets/pessoa_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  // Controllers para receber os dados digitados
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController identificacaoController =
      TextEditingController();

  // Lista de pessoas cadastradas
  List<Pessoa> listaPessoas = [];

  bool get isEmpty => contador <= 0;
  bool get isFull => contador >= 50;
  bool get isAlmostFull => contador >= 40 && contador < 50;

  // Mostra uma mensagem para o usuario
  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  // Cadastra uma pessoa e registra sua entrada
  void increment() {
    String nome = nomeController.text.trim();
    String identificacao = identificacaoController.text.trim();

    // Verifica se os campos foram preenchidos
    if (nome.isEmpty || identificacao.isEmpty) {
      mostrarMensagem("Preencha o nome e a identificação!");
      return;
    }

    // Verifica se o ambiente esta lotado
    if (isFull) {
      mostrarMensagem("Ambiente lotado! Entrada não permitida.");
      return;
    }

    // Verifica se a identificacao ja esta no ambiente
    for (Pessoa pessoa in listaPessoas) {
      if (pessoa.identificacao == identificacao &&
          pessoa.dataSaida == null) {
        mostrarMensagem("Esta identificação já está no ambiente!");
        return;
      }
    }

    // Criando um objeto Pessoa
    Pessoa novaPessoa = Pessoa(
      nome: nome,
      identificacao: identificacao,
      dataEntrada: DateTime.now(),
    );

    setState(() {
      listaPessoas.add(novaPessoa);
      contador++;
    });

    nomeController.clear();
    identificacaoController.clear();

    mostrarMensagem("Pessoa cadastrada com sucesso!");
  }

  // Registra a saida de uma pessoa
  void registrarSaida(Pessoa pessoa) {
    if (pessoa.dataSaida != null) {
      mostrarMensagem("Esta pessoa já saiu do ambiente!");
      return;
    }

    setState(() {
      pessoa.dataSaida = DateTime.now();
      contador--;
    });

    mostrarMensagem("Saída registrada com sucesso!");
  }

  // Botao SAIU da tela original
  void decrement() {
    for (int i = listaPessoas.length - 1; i >= 0; i--) {
      if (listaPessoas[i].dataSaida == null) {
        confirmarSaida(listaPessoas[i]);
        return;
      }
    }

    mostrarMensagem("Não há pessoas no ambiente!");
  }

  // Confirma a saida de uma pessoa
  void confirmarSaida(Pessoa pessoa) {
    if (pessoa.dataSaida != null) {
      mostrarMensagem("Esta pessoa já saiu do ambiente!");
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Registrar saída?"),
        content: Text(
          "Deseja realmente registrar a saída de ${pessoa.nome}?",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              registrarSaida(pessoa);
            },
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );
  }

  // Exclui uma pessoa da lista
  void excluirPessoa(Pessoa pessoa) {
    setState(() {
      // Se ainda estava no ambiente, libera uma vaga
      if (pessoa.dataSaida == null) {
        contador--;
      }

      // Remove o registro da lista
      listaPessoas.remove(pessoa);
    });

    mostrarMensagem("Registro excluído com sucesso!");
  }

  @override
  void dispose() {
    nomeController.dispose();
    identificacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/img/logo_bg.png',
          height: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 1, 1, 1),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          // Imagem original da CP1
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/creed_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Fundo escuro
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // Mensagem da lotacao
                    Text(
                      isFull
                          ? "Ambiente lotado!"
                          : isAlmostFull
                              ? "Quase lotado!"
                              : "Acesse o show",
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -3,
                      ),
                    ),

                    if (isFull)
                      const Text(
                        "Aguarde a liberação de novas vagas.",
                        style: TextStyle(color: Colors.white70),
                      ),

                    // Contador original
                    Text(
                      contador.toString(),
                      style: const TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                        letterSpacing: -2,
                      ),
                    ),

                    const Text(
                      "PESSOAS NO AMBIENTE / 50",
                      style: TextStyle(color: Colors.white),
                    ),

                    const SizedBox(height: 20),

                    // Cadastro de pessoas
                    const Text(
                      "CADASTRO DE PESSOAS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: nomeController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Nome da pessoa",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    TextField(
                      controller: identificacaoController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Identificação ou matrícula",
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Botoes originais da CP1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Botao SAIU
                        TextButton(
                          onPressed: isEmpty ? null : decrement,
                          style: TextButton.styleFrom(
                            backgroundColor: isEmpty
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
                            style: TextStyle(
                              color: isEmpty
                                  ? Colors.white54
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Botao ENTROU
                        TextButton(
                          onPressed: increment,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: const Size(110, 42),
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            "ENTROU",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "LISTA DE PESSOAS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Lista de pessoas cadastradas
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (Pessoa pessoa in listaPessoas)
                          PessoaItem(
                            pessoa: pessoa,
                            onSaida: confirmarSaida,
                            onExcluir: excluirPessoa,
                          ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "© 2026 CREED - SHOW CONTROL",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
