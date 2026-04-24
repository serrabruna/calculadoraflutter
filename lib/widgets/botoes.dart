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
                _botao('7', () {}),
                _botao('8', () {}),
                _botao('9', () {}),
                _botao('÷', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botao('4', () {}),
                _botao('5', () {}),
                _botao('6', () {}),
                _botao('×', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botao('1', () {}),
                _botao('2', () {}),
                _botao('3', () {}),
                _botao('-', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botao('0', () {}),
                _botao('.', () {}),
                _botao('=', () {}),
                _botao('+', () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botaoC('C', () {}),
                _botao('%', () {}),
                _botaoIcone(Icon(Icons.arrow_back), () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _botao(String numero, VoidCallback onPressed) {
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
  Widget _botaoC(String numero, VoidCallback onPressed) {
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
Widget _botaoIcone(Icon simbolo, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(85, 85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: simbolo, 
    ),
  );
}
}
