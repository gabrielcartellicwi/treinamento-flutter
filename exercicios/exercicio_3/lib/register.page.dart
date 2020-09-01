import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Color _black = Color(0xFF3D4A5A);
  final Color _grey = Color(0xFFB5B5B5);
  final Color _red = Color(0XFFE83F3F);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mNumberController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _pwdConfirmController = TextEditingController();
  TextEditingController _referalCodeController = TextEditingController();

  _saveForm() {
    print('Name: ${_nameController.text}');
    print('Email: ${_emailController.text}');
    print('Mobile Number: ${_mNumberController.text}');
    print('Country: ${_countryController.text}');
    print('Password: ${_pwdController.text}');
    print('Password Confirm: ${_pwdConfirmController.text}');
    print('Referal Code: ${_referalCodeController.text}');
  }

  _clearForm() {
      _nameController.text = '';
      _emailController.text = '';
      _mNumberController.text = '';
      _countryController.text = '';
      _pwdController.text = '';
      _pwdConfirmController.text = '';
      _referalCodeController.text = '';
    setState(() {

      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          fontSize: 14,
                          color: _red,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      onPressed: () {
                        _clearForm();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                            color: _grey,
                            fontSize: 16,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(
                          color: _black,
                          fontSize: 20,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            color: _grey,
                            fontSize: 16,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        textCapitalization: TextCapitalization.none,
                        style: TextStyle(
                          color: _black,
                          fontSize: 20,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Mobile number',
                          labelStyle: TextStyle(
                            color: _grey,
                            fontSize: 16,
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        controller: _mNumberController,
                        textCapitalization: TextCapitalization.none,
                        style: TextStyle(
                          color: _black,
                          fontSize: 20,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Country',
                          labelStyle: TextStyle(
                            color: _grey,
                            fontSize: 16,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        controller: _countryController,
                        textCapitalization: TextCapitalization.words,
                        style: TextStyle(
                          color: _black,
                          fontSize: 20,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: _grey,
                            fontSize: 16,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textCapitalization: TextCapitalization.none,
                        controller: _pwdController,
                        obscureText: true,
                        style: TextStyle(
                          color: _black,
                          fontSize: 20,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (value.length < 6) {
                            return 'A senha deve possuir 6 dígitos ou mais';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: _grey,
                            fontSize: 16,
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textCapitalization: TextCapitalization.none,
                        controller: _pwdConfirmController,
                        obscureText: true,
                        style: TextStyle(
                          color: _black,
                          fontSize: 20,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          if (value != _pwdController.text) {
                            return 'As senhas devem ser iguais';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Referal Code (Optional)',
                          labelStyle: TextStyle(
                            color: _grey,
                            fontSize: 16,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                        controller: _referalCodeController,
                        style: TextStyle(
                          color: _black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 315,
                      height: 50,
                      color: _red,
                      child: FlatButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Color(0XFFFFFFFF),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _saveForm();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}