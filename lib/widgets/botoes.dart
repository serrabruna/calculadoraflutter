import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  const Botoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Botoes"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botaoNumero('7', () {}),
                _botaoNumero('8', () {}),
                _botaoNumero('9', () {}),
                _botaoOperacao('÷', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botaoNumero('4', () {}),
                _botaoNumero('5', () {}),
                _botaoNumero('6', () {}),
                _botaoOperacao('×', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botaoNumero('1', () {}),
                _botaoNumero('2', () {}),
                _botaoNumero('3', () {}),
                _botaoOperacao('-', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botaoNumero('0', () {}),
                _botaoOperacao('.', () {}),
                _botaoOperacao('=', () {}),
                _botaoOperacao('+', () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _botaoNumero(String numero, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(85, 85),
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
          minimumSize: Size(85, 85),
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
}
