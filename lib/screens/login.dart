import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../components/button_login.dart';
import '../components/textPassWorld.dart';
import '../components/textUser.dart';

class login extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  final TextEditingController _controler_TextUser = TextEditingController();
  final TextEditingController _controler_PassWorld = TextEditingController();

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
            Editor(_controler_TextUser,'User','',Icons.perm_contact_cal,TextInputType.text, false),
            Container(
              height: 25,
            ),
            Editor(_controler_PassWorld,'Passworld','',Icons.password,TextInputType.emailAddress, true),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 30),
                ElevatedButton(
                  style: style,
                  onPressed: () =>  verifyLogin(context),
                  child: const Text('Entrar'),
                ),
              ],
            ),
          ],
        ),
      )

    );
  }
 void verifyLogin (BuildContext context){
    if (_controler_PassWorld.text == '123' && _controler_TextUser.text == 'Italo'){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FormularioTransferencia();
      }));
    }else {
      debugPrint('nao');
    }
 }
/*
Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormularioTransferencia();
                  }))
 */
}

