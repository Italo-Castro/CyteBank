import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ListaTransferencia(),
    ));
  }
}


class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            ItemTransferencia(Transferencia(100, 1)),
            ItemTransferencia(Transferencia(200, 2)),
            ItemTransferencia(Transferencia(300, 3)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future future = Navigator.push(context, MaterialPageRoute(builder: (context){
              return FormularioTransferencia();
            }));
            future.then((transferenciaRecebida) {
              debugPrint(' chegou no then do future');
              debugPrint(' $transferenciaRecebida');
            });
          },
          child: Icon(Icons.add),
        ));
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criando transferencia")
        ),
      body:Column(
            children: [
              Editor( _controladorCampoNumeroConta,  "Numero conta",  "000", Icons.work_outlined),
              Editor( _controladorCampoValor,  "Valor",  "0.00",  Icons.monetization_on),
              RaisedButton(onPressed: ()=> _criaTransferencia(context),
              child: Text("Confirmar"),)
            ],
          ),
        );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context,transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

   Editor(this.controlador, this.rotulo, this.dica, this.icone);


  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
            fontSize: 16.0
        ),
        decoration: InputDecoration(
            icon: Icon(icone),
            labelText: rotulo,
            hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}


class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
