import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:postest7_2009106106_yogatrisaputra/main.dart';

class Form_order extends StatelessWidget {
  final nama = new TextEditingController();
  final ttl = new TextEditingController();
  final alamat = new TextEditingController();
  final email = new TextEditingController();
  final noHp = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('106_postest7');
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hp.png'), fit: BoxFit.cover)),
              height: 900,
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 10),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return landingpage();
                              }));
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text('Log Store',
                              style: TextStyle(
                                fontFamily: 'san-serif',
                                fontSize: 40,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0),
                              )),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            controller: nama,
                            decoration: InputDecoration(
                              labelText: "Nama",
                              hintText: "Masukkan Nama",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            controller: ttl,
                            decoration: InputDecoration(
                              labelText: "Tempat Tanggal Lahir",
                              hintText: "Masukkan Tempat Tanggal Lahir",
                              prefixIcon: Icon(Icons.date_range),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            controller: alamat,
                            decoration: InputDecoration(
                              labelText: "Alamat",
                              hintText: "Masukkan Alamat",
                              prefixIcon: Icon(Icons.home),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Masukkan Email",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 0),
                          child: TextFormField(
                            controller: noHp,
                            decoration: InputDecoration(
                              labelText: "No Telepon",
                              hintText: "Masukkan No Telepon Anda",
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        // Menambahkan Data
                        users.add({
                          'nama': nama.text,
                          'ttl': ttl.text,
                          'alamat': alamat.text,
                          'email': email.text,
                          'noHp': int.parse(noHp.text)
                        });

                        nama.text = '';
                        ttl.text = '';
                        alamat.text = '';
                        email.text = '';
                        noHp.text = '';
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Read();
                        }));
                      }),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return Read();
                        }),
                      );
                    },
                    child: Text("Lihat Data"),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class Read extends StatelessWidget {
  final nama = new TextEditingController();
  final ttl = new TextEditingController();
  final alamat = new TextEditingController();
  final email = new TextEditingController();
  final noHp = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('106_postest7');
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/hp.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
        ListView(
          children: [
            // Lihat Data
            StreamBuilder<QuerySnapshot>(
              stream: users.snapshots(),
              builder: (_, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map((e) => ItemCard(
                                  e.get('nama'),
                                  e.get('ttl'),
                                  e.get('alamat'),
                                  e.get('email'),
                                  e.get('noHp'),
                                  //Hapus Data
                                  onDelete: () {
                                    users.doc(e.id).delete();
                                  },
                                  //Update Data
                                  onUpdate: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                              child: ListView(children: [
                                            AlertDialog(
                                              title: Text('Update Data'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextField(
                                                    controller: nama,
                                                    decoration: InputDecoration(
                                                        labelText: 'Nama'),
                                                  ),
                                                  TextField(
                                                    controller: ttl,
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            'Tempat Tanggal Lahir'),
                                                  ),
                                                  TextField(
                                                    controller: alamat,
                                                    decoration: InputDecoration(
                                                        labelText: 'Alamat'),
                                                  ),
                                                  TextField(
                                                    controller: email,
                                                    decoration: InputDecoration(
                                                        labelText: 'Email'),
                                                  ),
                                                  TextField(
                                                    controller: noHp,
                                                    decoration: InputDecoration(
                                                        labelText: 'No Hp'),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                FlatButton(
                                                  child: Text('Update'),
                                                  onPressed: () {
                                                    users.doc(e.id).update({
                                                      'nama': nama.text,
                                                      'ttl': ttl.text,
                                                      'alamat': alamat.text,
                                                      'email': email.text,
                                                      'noHp':
                                                          int.parse(noHp.text)
                                                    });
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return Read();
                                                    }));
                                                  },
                                                )
                                              ],
                                            ),
                                          ]));
                                        });
                                  },
                                ))
                            .toList(),
                      )
                    : Text('Loading...');
              },
            ),
            SizedBox(height: 150),
          ],
        ),
      ]),
    ));
  }
}

class ItemCard extends StatelessWidget {
  final String nama;
  final String ttl;
  final String alamat;
  final String email;
  final int noHp;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.nama, this.email, this.alamat, this.ttl, this.noHp,
      {this.onUpdate, this.onDelete});

  get index => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return landingpage();
                    }));
                  },
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text('Log Store',
                    style: TextStyle(
                      fontFamily: 'san-serif',
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue)),
                child: Text(
                  "Nama : $nama",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue)),
                child: Text(
                  "TTL : $ttl",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue)),
                child: Text(
                  "Alamat : $alamat",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue)),
                child: Text(
                  "Email : $email",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue)),
                child: Text(
                  "No Hp : $noHp",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 100, top: 20),
                child: SizedBox(
                  height: 40,
                  width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 94, 64, 27),
                      ),
                      child: Text("Edit"),
                      onPressed: () {
                        if (onUpdate != null) onUpdate!();
                      }),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 100, top: 20, left: 10),
                child: SizedBox(
                  height: 40,
                  width: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 183, 29, 29),
                      ),
                      child: Text("Delete"),
                      onPressed: () {
                        if (onDelete != null) onDelete!();
                      }),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
