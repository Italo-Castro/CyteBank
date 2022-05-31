import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextPassWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return TextField(
     obscureText: true,
     decoration: InputDecoration(
       border: OutlineInputBorder(),
       labelText: 'Senha',
     ),
   );
  }

}
