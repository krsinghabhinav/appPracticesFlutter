import 'package:flutter/material.dart';


class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double? _result;

  void add() {
    double n1 = double.parse(_num1Controller.text);
    double n2 = double.parse(_num2Controller.text);
    setState(() {
      _result = n1 + n2;
    });
  }

  void subtract() {
    double n1 = double.parse(_num1Controller.text);
    double n2 = double.parse(_num2Controller.text);
    setState(() {
      _result = n1 - n2;
    });
  }

  void multiply() {
    double n1 = double.parse(_num1Controller.text);
    double n2 = double.parse(_num2Controller.text);
    setState(() {
      _result = n1 * n2;
    });
  }

  void divide() {
    double n1 = double.parse(_num1Controller.text);
    double n2 = double.parse(_num2Controller.text);
    setState(() {
      _result = n2 != 0 ? n1 / n2 : double.nan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: add, child: Text('Add')),
                ElevatedButton(onPressed: subtract, child: Text('Subtract')),
                ElevatedButton(onPressed: multiply, child: Text('Multiply')),
                ElevatedButton(onPressed: divide, child: Text('Divide')),
              ],
            ),
            SizedBox(height: 30),
            Text(
              _result == null ? 'Result will appear here' : 'Result: $_result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
