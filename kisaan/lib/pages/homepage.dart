import 'package:flutter/material.dart';
import 'package:kisaan/pages/dataentry.dart';
import '../models/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  void initState() {
    super.initState();
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'E-Mail',
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
      ),
      obscureText: true,
      controller: _passwordTextController,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  Widget _buildPasswordConfirmTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
      ),
      obscureText: true,
      validator: (String value) {
        if (value != _passwordTextController.text &&
            _authMode == AuthMode.Signup) {
          return 'Password Do not match';
        }
        return null;
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Accept Terms and Condition'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500 : deviceWidth * 0.95;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(' ${_authMode == AuthMode.Login ? 'Login' : 'SignUp'}'),
        ),
        body: Container(
          decoration: BoxDecoration(
              ),
          padding: EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                  width: targetWidth,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        _buildEmailTextField(),
                        SizedBox(
                          height: 11.0,
                        ),
                        _buildPasswordTextField(),
                        SizedBox(
                          height: 10,
                        ),
                        _authMode == AuthMode.Signup
                            ? _buildPasswordConfirmTextField()
                            : Container(),
                        _buildAcceptSwitch(),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                          child: Text(
                              'Switch  to ${_authMode == AuthMode.Login ? 'Sign Up' : 'Login'}'),
                          onPressed: () {
                            if (_authMode == AuthMode.Login) {
                              setState(() {
                                _authMode = AuthMode.Signup;
                              });
                            } else {
                              setState(() {
                                _authMode = AuthMode.Login;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                          child: Text(
                              ' ${_authMode == AuthMode.Login ? 'Login' : 'SignUp'}'),
                          onPressed: () {
                            if (!_formKey.currentState.validate() ||
                                !_formData['acceptTerms']) {
                              return;
                            }
                            _formKey.currentState.save();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DataEntry()));
                          },
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
