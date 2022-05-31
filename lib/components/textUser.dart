
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Usuário',
      ),
    );
  }
}

