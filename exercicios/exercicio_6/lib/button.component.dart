import 'package:exercicio_6/utils/color.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  String label;
  Function(String buttonLabel) onButtonPressed;

  ButtonComponent({
    @required this.label,
    @required this.onButtonPressed,
  });

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          color: buttonColor[label],
          borderRadius: BorderRadius.circular(50),
        ),
        child: CupertinoButton(
          onPressed: () {
            onButtonPressed;
          },
          child: Text(
            label,
            style: TextStyle(
              color: buttonTextColor[label],
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
