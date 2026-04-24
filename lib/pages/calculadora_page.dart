import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  late TextEditingController _displayController;
  double _valorAnterior = 0;
  String _operacao = '';
  

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

  void _limpar() {
    setState(() {
      _displayController.text = '0';
      _valorAnterior = 0;
      _operacao = '';
    });
  }

  void _pressionarBotaoOperacao(String op){
    _valorAnterior = double.tryParse(_displayController.text) ?? 0;
    _operacao = op;
    setState(() {
      _displayController.text = '0';
    });
  }

  void _calcularResultado() {
    double valorAtual = double.tryParse(_displayController.text) ?? 0;
    double resultado = 0;

    switch (_operacao) {
      case '+':
        resultado = _valorAnterior + valorAtual;
        break;
      case '-':
        resultado = _valorAnterior - valorAtual;
        break;
      case '×':
        resultado = _valorAnterior * valorAtual;
        break;
      case '÷':
        if (valorAtual != 0) {
          resultado = _valorAnterior / valorAtual;
        } else {
          resultado = _valorAnterior;
        }
        break;
      case '%':
        resultado = _valorAnterior * (valorAtual / 100);
        break;
    }

    setState(() {
      _displayController.text = resultado % 1 == 0 ? resultado.toInt().toString() : resultado.toString();
    });
  }

  void _apagar(){
    setState((){
      if(_displayController.text.length > 1){
        _displayController.text = _displayController.text.substring(0, _displayController.text.length - 1);
      } else {
        _displayController.text = '0';
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
        child: Text(numero, style: TextStyle(fontSize: 24, color: Colors.deepPurple[300])),
      ),
    );
  }

  Widget _botaoOperacao(String simbolo, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[50],
          minimumSize: Size(75, 75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          simbolo,
          style: TextStyle(fontSize: 24, color: Colors.deepPurple[400]),
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
            _botaoOperacao('C', () => _limpar()),
            _botaoOperacao('%', () => _pressionarBotaoOperacao('%')),
            _botaoOperacao('<--', () => _apagar()),
            _botaoOperacao('÷', () => _pressionarBotaoOperacao('÷')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoNumero('7', () => _pressionarBotao('7')),
            _botaoNumero('8', () => _pressionarBotao('8')),
            _botaoNumero('9', () => _pressionarBotao('9')),
            _botaoOperacao('×', () => _pressionarBotaoOperacao('×')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoNumero('4', () => _pressionarBotao('4')),
            _botaoNumero('5', () => _pressionarBotao('5')),
            _botaoNumero('6', () => _pressionarBotao('6')),
            _botaoOperacao('-', () => _pressionarBotaoOperacao('-')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoNumero('1', () => _pressionarBotao('1')),
            _botaoNumero('2', () => _pressionarBotao('2')),
            _botaoNumero('3', () => _pressionarBotao('3')),
            _botaoOperacao('+', () => _pressionarBotaoOperacao('+')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _botaoNumero('0', () => _pressionarBotao('0')),
            _botaoNumero('.', () => _pressionarBotao('.')),
            _botaoOperacao('=', () => _calcularResultado()),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 169, 198, 223), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 169, 198, 223), width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.blue[50],
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
