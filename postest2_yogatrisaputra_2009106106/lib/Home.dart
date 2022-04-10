import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  landingpage createState() => landingpage();
}

class landingpage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2009106106_YogaTriSaputra"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/hp.png'), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/log.png'))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(50),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Cek Sekarang ->',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    filled: true,
                    fillColor: Color(0xff1F5DE0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
