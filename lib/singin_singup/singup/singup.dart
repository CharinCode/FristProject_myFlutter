import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final _fromkey = GlobalKey<FormState>();
  late String nameString, emailString, passwordString;

  @override
  Widget build(BuildContext context) {
    //
    Future<void> registerThread() async {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailString, password: passwordString)
          .then((response) {
        print('Register Success for Email = $emailString');
      }).catchError((response) {
        String title = response.code;
        String message = response.message;
        print('title = $title , message = $message');
      });
    }

    Widget resgisterButton() {
      return IconButton(
        icon: const Icon(Icons.cloud_upload),
        onPressed: () {
          print('You click Upload');
          if (_fromkey.currentState!.validate()) {
            _fromkey.currentState!.save();
            print(
                'name = $nameString email = $emailString password = $passwordString');
            registerThread();
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
        onSaved: (newValue) {
          nameString = newValue!.trim();
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
        onSaved: (newValue) => emailString = newValue!.trim(),
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
        onSaved: (newValue) {
          passwordString = newValue!.trim();
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
