import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Matemática',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();

  String _result = '';

  void _findMax() {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);
    int num3 = int.parse(_num3Controller.text);
    int maxNum = num1 > num2 ? (num1 > num3 ? num1 : num3) : (num2 > num3 ? num2 : num3);
    setState(() {
      _result = 'Número Mayor: $maxNum';
    });
  }

  void _findMin() {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);
    int num3 = int.parse(_num3Controller.text);
    int minNum = num1 < num2 ? (num1 < num3 ? num1 : num3) : (num2 < num3 ? num2 : num3);
    setState(() {
      _result = 'Número Menor: $minNum';
    });
  }

  void _calculateSquare() {
    int num1 = int.parse(_num1Controller.text);
    setState(() {
      _result = 'Cuadrado de número 1: ${num1 * num1}';
    });
  }

  void _calculateCube() {
    int num1 = int.parse(_num1Controller.text);
    setState(() {
      _result = 'Cubo de número 1: ${num1 * num1 * num1}';
    });
  }
  void _clearFields() {
    _num1Controller.clear();
    _num2Controller.clear();
    _num3Controller.clear();
    setState(() {
      _result = '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Matemática'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              decoration: InputDecoration(labelText: 'Número 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration: InputDecoration(labelText: 'Número 2'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num3Controller,
              decoration: InputDecoration(labelText: 'Número 3'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _findMax,
              child: Text('Encontrar Mayor'),
            ),
            ElevatedButton(
              onPressed: _findMin,
              child: Text('Encontrar Menor'),
            ),
            ElevatedButton(
              onPressed: _calculateSquare,
              child: Text('Cuadrado de Número 1'),
            ),
            ElevatedButton(
              onPressed: _calculateCube,
              child: Text('Cubo de Número 1'),
            ),
              ElevatedButton(
              onPressed: _clearFields,
              child: Text('Limpiar'),
            ),
          
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}