import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pendataanrumahsakit/model/rumahsakit.dart';
import 'package:pendataanrumahsakit/screen/dashboard2.dart';

import 'package:pendataanrumahsakit/screen/rumah2.dart';
import 'package:pendataanrumahsakit/screen/tambah.dart';
import 'package:pendataanrumahsakit/screen/tambah2.dart';

class RumahScreen extends StatefulWidget {
  RumahScreen({Key? key}) : super(key: key);

  @override
  State<RumahScreen> createState() => _RumahScreenState();
}

class _RumahScreenState extends State<RumahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Rumah2Screen();
              }));
            },
            icon: Icon(Icons.edit_note),
          )
        ],
        title: Text('Data Rumah Sakit Lhoksumawe'),
      ),
      body: StreamBuilder<List<RmSkt>>(
        stream: readRmSkt(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Text('Ada yang error');
          } else if (snapshot.hasData) {
            final rumahsakits = snapshot.data!;

            return ListView(
              children: rumahsakits.map(buildRmSkt).toList(),
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
            return TambahRumah();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildRmSkt(RmSkt rmSkt) => ListTile(
        leading: CircleAvatar(
          child: Text('${rmSkt.jumlahdc}'),
        ),
        title: Text(rmSkt.nama),
        subtitle: Text(rmSkt.alamat),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  final docRmSkt = FirebaseFirestore.instance
                      .collection('rumahsakits')
                      .doc(rmSkt.id);

                  //update
                  docRmSkt.delete();
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      );

  Stream<List<RmSkt>> readRmSkt() => FirebaseFirestore.instance
      .collection('rumahsakits')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => RmSkt.fromJson(doc.data())).toList());
}
