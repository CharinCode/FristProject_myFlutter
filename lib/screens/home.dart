import 'package:flutter/material.dart';
import 'package:fluuter_prooject/singin_singup/singin/singin.dart';
import 'package:fluuter_prooject/singin_singup/singup/singup.dart';

class RunPage extends StatelessWidget {
  const RunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //แสดงLOGO
  Widget Showlogo() {
    return Image.asset(
      'images/logoshopping/shopping.png',
      width: 300,
    );
  }

//แสดงชื่อ
  Widget Showname() {
    return Text(
      'Charin Shopping',
      style: TextStyle(
          fontSize: 25,
          color: Colors.lightBlue,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    );
  }

  //แสดงปุ่มsingIn
  Widget ShowSingIn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const SingInPage();
            },
          ),
        );
      },
      child: const Text('Sing In'),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 255, 116, 106))),
    );
  }

  //แสดงปุ่ม Singup
  Widget ShowSingUp() {
    return OutlinedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const SingUpPage();
            },
          ),
        );
      },
      child: Text('Sing Up'),
    );
  }

  Widget ShowButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShowSingIn(),
        const SizedBox(
          width: 10,
        ),
        ShowSingUp()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Shopping')),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 211, 206, 165),
              Color.fromARGB(255, 247, 214, 255),
            ],
            radius: 2,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Showlogo(),
              Showname(),
              ShowButton(),
            ],
          ),
        ),
      )),
    );
  }
}
