import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest7_2009106106_yogatrisaputra/main.dart';

void main() {
  runApp(const Feed());
}

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Feedback(),
    );
  }
}

class TextController1 extends GetxController {
  var namaAnda = "".obs;
  var deskripsi = "".obs;
  final namaDepanCtrl = TextEditingController();
  final deskAndaCtrl = TextEditingController();

  onPressed() {
    namaAnda = namaDepanCtrl.text.obs;
    deskripsi = deskAndaCtrl.text.obs;
  }
}

class Feedback extends StatelessWidget {
  Feedback({Key? key}) : super(key: key);

  final TextController1 textCtrl = Get.put(TextController1());
  final TextController1 deskripsiCtrl = Get.put(TextController1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            color: Colors.white,
            iconSize: 25,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return landingpage();
              }));
            }),
        title: Text(
          "Feedback",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(18.0),
        children: [
          Column(
            children: [
              Container(
                child: TextField(
                  controller: textCtrl.namaDepanCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama Anda",
                    hintText: "Nama",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: 2,
                controller: deskripsiCtrl.deskAndaCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Komentar",
                  hintText: "Isi Komentar",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: textCtrl.onPressed, child: Text("Submit")),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Output()));
                  },
                  child: Text("Cek Feedback"))
            ],
          ),
        ],
      ),
    );
  }
}

class Output extends StatelessWidget {
  Output({Key? key}) : super(key: key);

  final TextController1 textCtrl = Get.find();
  final TextController1 deskripSiCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feedback",
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "Nama : ${textCtrl.namaAnda.value}",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Komentar : ${deskripSiCtrl.deskripsi.value}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
