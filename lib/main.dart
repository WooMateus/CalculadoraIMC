import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  String _respostaTexto = "Informe seus dados.";

  void _calcular() {
    double peso = double.parse(_pesoController.text.replaceAll(',', '.'));
    double altura = double.parse(_alturaController.text.replaceAll(',', '.'));
    double IMC = peso / (altura * altura);
    _verificarIMC(IMC);
  }

  void _verificarIMC(double IMC) {
    setState(() {
      if (IMC < 18.6) {
        _respostaTexto = "Abaixo do peso (${IMC.toStringAsPrecision(4)}).";
      } else if (IMC >= 18.6 && IMC < 24.9) {
        _respostaTexto = "Peso ideal (${IMC.toStringAsPrecision(4)}).";
      } else if (IMC >= 24.9 && IMC < 29.9) {
        _respostaTexto =
            "Levemente acima do peso (${IMC.toStringAsPrecision(4)}).";
      } else if (IMC >= 29.9 && IMC < 34.9) {
        _respostaTexto = "Obesidade grau I (${IMC.toStringAsPrecision(4)}).";
      } else if (IMC >= 34.9 && IMC < 39.9) {
        _respostaTexto = "Obesidade grau II (${IMC.toStringAsPrecision(4)}).";
      } else {
        _respostaTexto = "Obesidade grau III (${IMC.toStringAsPrecision(4)}).";
      }
    });
  }

  void _limparCampos() {
    _pesoController.text = "";
    _alturaController.text = "";
    setState(() {
      _respostaTexto = "Informe seus Dados.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: _limparCampos,
          ),
        ],
        title: Text("Calculadora de IMC",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (KG)",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (M)",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () => _calcular(),
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffFE5114)),
                    ),
                  ),
                ),
              ),
              Text(
                _respostaTexto,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
