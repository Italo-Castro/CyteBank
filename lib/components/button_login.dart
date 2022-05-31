import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLogin extends StatefulWidget {
  const ButtonLogin({Key? key}) : super(key: key);

  @override
  State<ButtonLogin> createState() => _WidgetButtonLogin();
}

class _WidgetButtonLogin extends State<ButtonLogin> {
  final TextEditingController _textUser = TextEditingController();
  final TextEditingController _textPassWorld = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () =>  loginVerify(context),
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }

  void loginVerify(BuildContext context) {
    final user = _textUser;
    final passworld = _textPassWorld;

    if (user != null && user == 'italo' && passworld != null && passworld == '123'){
      debugPrint('Logado');
    } else {
      debugPrint('Usuário ou senha invalidos');
    }

  }
}