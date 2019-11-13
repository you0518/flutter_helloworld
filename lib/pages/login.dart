import 'package:flutter/material.dart';
import 'package:flutter_helloworld/components/side_menu.dart';

class Login extends StatelessWidget {
  static const String routeName = '/';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _employeeId = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              formEmployeeId(context),
              formPassword(context),
              formSubmit(context)
            ],
          ),
        ));
  }

  TextFormField formEmployeeId(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(hintText: '社員ID', labelText: '社員ID'),
      validator: this._validate,
      autovalidate: true,
      onSaved: (String value) => this._employeeId = value,
    );
  }

  TextFormField formPassword(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: _validate,
      autovalidate: true,
      decoration: InputDecoration(
          hintText: 'Password', labelText: 'Enter your password'),
      onSaved: (String value) => this._password = value,
    );
  }

  Container formSubmit(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Container(
      width: screenSize.width,
      child: new RaisedButton(
        child: Text(
          'Login',
          style: new TextStyle(color: Colors.black),
        ),
        onPressed: this.submit,
      ),
    );
  }

  String _validate(String value) {
    if (value.length < 8) {
      return 'The string must be at least 8 characters.';
    }

    return null;
  }

  void submit() {
    if (!this._formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save(); //onSavedが呼ばれる
    print('Printing the login data.');
    print('Email: ${this._employeeId}');
    print('Password: ${this._password}');

    Navigator.of(context).pushNamed('/clock');
  }
}
