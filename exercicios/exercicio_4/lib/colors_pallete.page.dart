import 'package:exercicio_4/color_utils.dart';
import 'package:flutter/material.dart';

class ColorsPallete extends StatefulWidget {
  @override
  _ColorsPalleteState createState() => _ColorsPalleteState();
}

class _ColorsPalleteState extends State<ColorsPallete> {
  TextEditingController colorOneController = TextEditingController();
  TextEditingController colorTwoController = TextEditingController();
  TextEditingController colorThreeController = TextEditingController();

  Color colorOne = Color(0xffffffff);
  Color colorTwo = Color(0xffffffff);
  Color colorThree = Color(0xffffffff);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _updateColors() {
    setState(() {
      String colorOneHex = colorOneController.text;
      String colorTwoHex = colorTwoController.text;
      String colorThreeHex = colorThreeController.text;

      colorOne = ColorUtils.fromHex(colorOneHex);
      colorTwo = ColorUtils.fromHex(colorTwoHex);
      colorThree = ColorUtils.fromHex(colorThreeHex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: colorOne,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Código cor (hex):',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black, fontSize: 24),
                        controller: colorOneController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: colorTwo,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Código cor (hex):',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black, fontSize: 24),
                        controller: colorTwoController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: colorThree,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Código cor (hex):',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black, fontSize: 24),
                        controller: colorThreeController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                    top: 8.0,
                    left: 30,
                    right: 30,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    child: RaisedButton(
                      color: Colors.grey[400],
                      child: Text(
                        'Atualizar',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        if(_formKey.currentState.validate()){
                          _updateColors();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
