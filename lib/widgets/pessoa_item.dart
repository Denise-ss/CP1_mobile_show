
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../models/pessoa.dart';

class PessoaItem extends StatelessWidget {
  final Pessoa pessoa;
  final Function(Pessoa) onSaida;
  final Function(Pessoa) onExcluir;

  const PessoaItem({
    super.key,
    required this.pessoa,
    required this.onSaida,
    required this.onExcluir,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(pessoa),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              onSaida(pessoa);
            },
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            icon: Icons.exit_to_app,
            label: "SAÍDA",
          ),
          SlidableAction(
            onPressed: (context) {
              onExcluir(pessoa);
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "EXCLUIR",
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          title: Text(pessoa.nome),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${pessoa.identificacao}"),
              Text(
                "Entrada: ${DateFormat('dd/MM/yyyy HH:mm').format(pessoa.dataEntrada)}",
              ),
              Text(
                pessoa.dataSaida == null
                    ? "Situação: No ambiente"
                    : "Situação: Saiu",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
