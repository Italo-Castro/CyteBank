import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../components/button_login.dart';
import '../components/textPassWorld.dart';
import '../components/textUser.dart';

class login extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  final TextField _textUser = TextField();
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: Text('Bem vindo!',textAlign: TextAlign.center,),
          backgroundColor: Colors.green,
        ),
      body: SingleChildScrollView(
        child: Column (
          children: [
            Container(
              height: 150,
            ),
            TextUser(),
            Container(
              height: 25,
            ),
            TextPassWorld(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 30),
                ElevatedButton(
                  style: style,
                  onPressed: () =>  ListaTransferencia() /*loginVerify(context)*/,
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ],
        ),
      )

    );
  }
  void loginVerify(BuildContext context) {

    final TextEditingController _textPassWorld = TextEditingController();
    final user = _textUser;
    final passworld = _textPassWorld;

    if (user != null && user == 'italo' && passworld != null && passworld == '123'){
      debugPrint('Logado');
    } else {
      debugPrint('Usuário ou senha invalidos');
    }

  }

}

