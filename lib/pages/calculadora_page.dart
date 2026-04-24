import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  late TextEditingController _displayController;

  @override
  void initState() {
    super.initState();
    _displayController = TextEditingController(text: '0');
  }

  void _pressionarBotao(String valor) {
    setState(() {
      if (_displayController.text == '0') {
        _displayController.text = valor;
      } else {
        _displayController.text += valor;
      }
    });
  }

  Widget _botaoNumero(String numero, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(75, 75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(numero, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  Widget _botaoOperacao(String simbolo, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(75, 75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          simbolo,
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }

  Widget _gradeBotoes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoOperacao('C', () {}),
            _botaoOperacao('%', () {}),
            _botaoOperacao('<--', () {}),
            _botaoOperacao('÷', () {}),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoNumero('7', () => _pressionarBotao('7')),
            _botaoNumero('8', () => _pressionarBotao('8')),
            _botaoNumero('9', () => _pressionarBotao('9')),
            _botaoOperacao('×', () {}),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoNumero('4', () => _pressionarBotao('4')),
            _botaoNumero('5', () => _pressionarBotao('5')),
            _botaoNumero('6', () => _pressionarBotao('6')),
            _botaoOperacao('-', () {}),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoNumero('1', () => _pressionarBotao('1')),
            _botaoNumero('2', () => _pressionarBotao('2')),
            _botaoNumero('3', () => _pressionarBotao('3')),
            _botaoOperacao('+', () {}),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoNumero('0', () => _pressionarBotao('0')),
            _botaoNumero('.', () {}),
            _botaoOperacao('=', () {}),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextField(
                    controller: _displayController,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 32),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.blue[100],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 35),
          _gradeBotoes(),
        ],
      ),
    );
  }
}
