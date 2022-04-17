import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool acc = false;
  String email = "", password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 9, 10, 10),
          title: Text("YogaTriSaputra"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              iconSize: 25,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              iconSize: 25,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.chat_outlined),
              iconSize: 25,
              onPressed: () {},
            ),
          ]),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/hp.png'), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 1,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/log.png'))),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                'Log Store',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 35),
              ),
            ),
            Text(
              'Menjual Berbagai Macam Hp Gaming \n Dengan Kualitas Spesifikasi Dewa',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              margin: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: 'Masukkan Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordCtrl,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukkan Password',
                        labelText: "Password"),
                  ),
                  ListTile(
                    title: const Text("Ingat Akun?"),
                    leading: Checkbox(
                      value: acc,
                      onChanged: (bool? value) {
                        setState(() {
                          acc = value!;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        email = emailCtrl.text;
                        password = passwordCtrl.text;
                      });
                    },
                    child: const Text("LOGIN"),
                  ),
                  Text('Email : $email'),
                  Text('Password : $password'),
                  Text(
                    'Akun ${acc ? "Tersimpan" : "Tidak Tersimpan"}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
