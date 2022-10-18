import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final _fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Widget resgisterButton() {
      return IconButton(
        icon: const Icon(Icons.cloud_upload),
        onPressed: () {
          print('You click Upload');
          if (_fromkey.currentState!.validate()) {
            _fromkey.currentState!.save();
          }
          ;
        },
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill Your name in the blak';
          } else {
            return null;
          }
        },
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
        validator: (value) {
          if (!((value!.contains(('@'))) && (value!.contains('.')))) {
            return 'Please Type Email in Emial Format Exp. you@emal.com';
          } else {
            return null;
          }
        },
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
        validator: (value) {
          if (value!.length < 6) {
            return 'Password more 6 Charactor';
          } else {
            return null;
          }
        },
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
      body: Form(
        key: _fromkey,
        child: ListView(padding: EdgeInsets.all(30.0), children: <Widget>[
          nameText(),
          emailText(),
          passwordText(),
        ]),
      ),
    );
  }
}
