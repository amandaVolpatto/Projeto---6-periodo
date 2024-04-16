import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaServicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serviços"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Centraliza verticalmente no centro
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _showDialog(context, "Corte", "Detalhes do serviço 1: Oferecemos um corte simples que...");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black), // Mudança para cor do botão preta
                foregroundColor: MaterialStateProperty.all(Colors.white), // Cor do texto branco
              ),
              child: Text('Corte'),
            ),
            SizedBox(height: 20), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                _showDialog(context, "Corte e Barba", "Detalhes do serviço 2: Oferecemos corte e barba com...");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black), // Mudança para cor do botão preta
                foregroundColor: MaterialStateProperty.all(Colors.white), // Cor do texto branco
              ),
              child: Text('Corte e Barba'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showDialog(context, "Hidratação", "Detalhes do serviço 3: Oferecemos hidratação capilar profunda...");
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black), // Mudança para cor do botão preta
                foregroundColor: MaterialStateProperty.all(Colors.white), // Cor do texto branco
              ),
              child: Text('Hidratação'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context). pop(); // Fecha o AlertDialog
              },
              child: Text('Fechar', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
