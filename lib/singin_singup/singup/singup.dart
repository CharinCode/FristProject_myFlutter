import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  @override
  Widget build(BuildContext context) {
    Widget resgisterButton() {
      return IconButton(
        onPressed: () {
          print('You click Upload');
        },
        icon: const Icon(Icons.cloud_upload),
      );
    }

    Widget nameText() {
      return TextFormField(
        style: TextStyle(color: Colors.blue),
        decoration: InputDecoration(
            icon: Icon(
              Icons.face,
              color: Colors.blue,
            ),
            labelText: 'Display Name :',
            labelStyle: TextStyle(color: Colors.blue),
            helperText: 'Type Your Nick Name For Display'),
      );
    }

    Widget emailText() {
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            icon: Icon(
              Icons.email,
              color: Colors.green,
            ),
            labelText: 'Email :',
            labelStyle: TextStyle(color: Colors.green),
            helperText: 'Type Your Email'),
      );
    }

    Widget passwordText() {
      return TextFormField(
        decoration: InputDecoration(
            icon: Icon(
              Icons.password,
              color: Colors.black,
            ),
            labelText: 'Password :',
            labelStyle: TextStyle(color: Colors.black),
            helperText: 'Type Your password mor 6 Charactor'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 229, 255),
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[resgisterButton()],
      ),
      body: ListView(padding: EdgeInsets.all(30.0), children: <Widget>[
        nameText(),
        emailText(),
        passwordText(),
      ]),
    );
  }
}
