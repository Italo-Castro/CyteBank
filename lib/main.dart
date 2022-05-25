import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FormularioTransferencia(),
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
          onPressed: () {},
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controladorCampoNumeroConta,
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                  decoration: InputDecoration(
                      labelText: 'Número da conta',
                      hintText: '00'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controladorCampoValor,
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                      labelText: 'Valor',
                      hintText: '00.0'),
                  keyboardType: TextInputType.number,
                ),
              ),
              RaisedButton(onPressed: (){
                debugPrint('Clicou no botão');
                debugPrint( _controladorCampoNumeroConta.text);
                debugPrint( "Valor"+_controladorCampoValor.text);

                final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
                final double? valor = double.tryParse(_controladorCampoValor.text);

                if(numeroConta != null && valor != null) {
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint( '$transferenciaCriada');
                }


              },
              child: Text("Confirmar"),)
            ],
          ),
        );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

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
