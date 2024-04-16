import 'package:flutter/material.dart';
import 'tela_editar_perfil.dart';  // Certifique-se que o caminho de importação está correto

class TelaPerfil extends StatefulWidget {
  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  String userName = "Nome do Usuário";
  String userEmail = "usuario@example.com";

  void _navigateAndEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaEditarPerfil()),
    );

    // Atualiza a interface do usuário com os novos dados retornados, se houver
    if (result != null) {
      setState(() {
        userName = result['name'];
        userEmail = result['email'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://via.placeholder.com/150"),
            ),
            SizedBox(height: 20),
            Text(userName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(userEmail, style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _navigateAndEditProfile,
              child: Text('Editar Perfil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("Mudar Senha clicado");
              },
              child: Text('Mudar Senha'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("Sair clicado");
              },
              child: Text('Sair'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
