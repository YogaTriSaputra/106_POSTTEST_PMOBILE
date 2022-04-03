import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'POSTEST 1',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var panjang = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Postest 1 Yoga'),
        backgroundColor: Color.fromARGB(255, 6, 103, 178),
      ),
      body: Center(
        child: Container(
          width: lebar / 1,
          height: panjang / 1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.25),
            colors: <Color>[Colors.black, Color.fromARGB(255, 240, 24, 0)],
            tileMode: TileMode.repeated,
          )),
          child: const Center(
            child: Text(
              'Log Store',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 50,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
