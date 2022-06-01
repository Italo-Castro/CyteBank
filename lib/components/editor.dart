import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;
  final TextInputType typeTextInput;
  final bool issPasworld;
  Editor(this.controlador, this.rotulo, this.dica, this.icone, this.typeTextInput, this.issPasworld);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 16.0),
        obscureText: issPasworld,
        decoration: InputDecoration(
            icon: Icon(icone), labelText: rotulo, hintText: dica),
        keyboardType: typeTextInput,
      ),
    );
  }
}
