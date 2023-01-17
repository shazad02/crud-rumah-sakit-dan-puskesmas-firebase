import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pendataanrumahsakit/model/puskesmas.dart';

import 'package:pendataanrumahsakit/screen/dashboard2.dart';

import 'package:pendataanrumahsakit/screen/tambah.dart';

class DashScreen extends StatefulWidget {
  DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Dash2Screen();
              }));
            },
            icon: Icon(Icons.edit_note),
          )
        ],
        title: Text('Data Rumah Sakit Lhoksumeawe'),
      ),
      body: StreamBuilder<List<Puskes>>(
        stream: readPuskes(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Text('Ada yang error');
          } else if (snapshot.hasData) {
            final puskesmas = snapshot.data!;

            return ListView(
              children: puskesmas.map(buildPuskes).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 236, 32, 40),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TambahScreen();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildPuskes(Puskes puskes) => ListTile(
        leading: CircleAvatar(
          child: Text('${puskes.jumlahp}'),
        ),
        title: Text(puskes.nama),
        subtitle: Text(puskes.alamat),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  final docPuskes = FirebaseFirestore.instance
                      .collection('puskesmas')
                      .doc(puskes.id);

                  //update
                  docPuskes.delete();
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      );

  Stream<List<Puskes>> readPuskes() => FirebaseFirestore.instance
      .collection('puskesmas')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Puskes.fromJson(doc.data())).toList());
}
