import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = 'Criando transferencia';
const _rotuloConta = 'Numero Conta';
const _dicaConta = '123';

const _dicaValor = '0.00';
const _rotuloValor = 'Valor';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormulrioTransferenciaState();
  }
}

class FormulrioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(_controladorCampoNumeroConta, _rotuloConta, _dicaConta,
                Icons.work_outlined),
            Editor(_controladorCampoValor, _rotuloValor, _dicaValor,
                Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);


    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    } else {
      SimpleDialog(
          title: const Text('Select assignment'),
          children: <Widget>[
          SimpleDialogOption(
          onPressed: ()
      {
        Navigator.pop(context, "1");
      },
    child: const Text('Treasury department'),
    ),
    SimpleDialogOption(
    onPressed: () { Navigator.pop(context, "2"); },
    child: const Text('State department'),
    )]);
  }

  }
}
