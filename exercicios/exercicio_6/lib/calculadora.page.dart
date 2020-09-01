import 'package:exercicio_6/button.component.dart';
import 'package:exercicio_6/utils/color.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayValue = '0';
  String _valueOne = '0';
  String _valueTwo = '0';
  String _actualOperation;
  double _result;
  bool _operationOn = false;

  _buttonLogic(buttonLabel) {
    setState(() {
      if (_numberLabelList.contains(buttonLabel) && !_operationOn) {
        if (_valueOne == '0') {
          _valueOne = buttonLabel;
        } else {
          _valueOne += buttonLabel;
        }
        _displayValue = _valueOne;
      }

      if (_numberLabelList.contains(buttonLabel) && _operationOn) {
        if (_valueTwo == '0') {
          _valueTwo = buttonLabel;
        } else {
          _valueTwo += buttonLabel;
        }
        _displayValue = _valueTwo;
      }

      if (buttonLabel == '=') {
        switch (_actualOperation) {
          case "/":
            {
              _result = double.parse(_valueOne) / double.parse(_valueTwo);
            }
            break;
          case "x":
            {
              _result = double.parse(_valueOne) * double.parse(_valueTwo);
            }
            break;
          case "-":
            {
              _result = double.parse(_valueOne) - double.parse(_valueTwo);
            }
            break;
          case "+":
            {
              _result = double.parse(_valueOne) + double.parse(_valueTwo);
            }
            break;
        }

        _displayValue = _result.toString();
      }

      if (buttonLabel == 'AC') {
        _valueOne = '0';
        _valueTwo = '0';
        _actualOperation = '';
        _operationOn = false;
        _displayValue = '0';
      }

      if (_operationLabelList.contains(buttonLabel)) {
        _actualOperation = buttonLabel;
        _operationOn = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _displayValue,
                    style: TextStyle(
                      fontSize: 94,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  children: List.generate(20, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: buttonColor[_buttonLabelList[index]],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CupertinoButton(
                          onPressed: () {
                            _buttonLogic(_buttonLabelList[index]);
                          },
                          child: Text(
                            _buttonLabelList[index],
                            style: TextStyle(
                              color: buttonTextColor[_buttonLabelList[index]],
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, Color> buttonColor = {
    'AC': ColorUtils.grey,
    '+/-': ColorUtils.grey,
    '%': ColorUtils.grey,
    '/': ColorUtils.orange,
    '7': ColorUtils.lightBlack,
    '8': ColorUtils.lightBlack,
    '9': ColorUtils.lightBlack,
    'x': ColorUtils.orange,
    '4': ColorUtils.lightBlack,
    '5': ColorUtils.lightBlack,
    '6': ColorUtils.lightBlack,
    '-': ColorUtils.orange,
    '1': ColorUtils.lightBlack,
    '2': ColorUtils.lightBlack,
    '3': ColorUtils.lightBlack,
    '+': ColorUtils.orange,
    '0': ColorUtils.lightBlack,
    ' ': ColorUtils.lightBlack,
    '.': ColorUtils.lightBlack,
    '=': ColorUtils.orange,
  };

  Map<String, Color> buttonTextColor = {
    'AC': ColorUtils.black,
    '+/-': ColorUtils.black,
    '%': ColorUtils.black,
    '/': ColorUtils.white,
    '7': ColorUtils.white,
    '8': ColorUtils.white,
    '9': ColorUtils.white,
    'x': ColorUtils.white,
    '4': ColorUtils.white,
    '5': ColorUtils.white,
    '6': ColorUtils.white,
    '-': ColorUtils.white,
    '1': ColorUtils.white,
    '2': ColorUtils.white,
    '3': ColorUtils.white,
    '+': ColorUtils.white,
    '0': ColorUtils.white,
    ' ': ColorUtils.white,
    '.': ColorUtils.white,
    '=': ColorUtils.white,
  };

  List<String> _buttonLabelList = [
    'AC',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    ' ',
    '.',
    '='
  ];

  List<String> _numberLabelList = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
  ];

  List<String> _operationLabelList = ['/', 'x', '-', '+'];
}
