import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pendataanrumahsakit/model/rumahsakit.dart';
import 'package:pendataanrumahsakit/screen/dashboard.dart';

class TambahRumah extends StatefulWidget {
  TambahRumah({Key? key}) : super(key: key);

  @override
  State<TambahRumah> createState() => _TambahRumahState();
}

class _TambahRumahState extends State<TambahRumah> {
  final controllerName = TextEditingController();
  final controllerAlamat = TextEditingController();
  final controllerjmldc = TextEditingController();
  final controllerjmlkt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tambah Rumah Sakit'),
        backgroundColor: Color.fromARGB(255, 87, 155, 177),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: controllerName,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              labelText: 'Nama Rumah Sakit',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            controller: controllerAlamat,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              labelText: 'Alamat Rumah Sakit',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            keyboardType: TextInputType.number,
            controller: controllerjmldc,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              labelText: 'Jumlah Dokter',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            keyboardType: TextInputType.number,
            controller: controllerjmlkt,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              labelText: 'Jumlah Kuota IGD',
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 44, 116, 179),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              final rmskt = RmSkt(
                nama: controllerName.text,
                alamat: controllerAlamat.text,
                jumlahdc: int.parse(controllerjmldc.text),
                jumlahkuota: int.parse(controllerjmlkt.text),
              );
              createRumah(rmskt);
              Navigator.pop(context);
            },
            child: Text('Tambah Data'),
          )
        ],
      ),
    );
  }

  Future createRumah(RmSkt rmskt) async {
    final docrmskt = FirebaseFirestore.instance.collection('rumahsakits').doc();
    rmskt.id = docrmskt.id;

    final json = rmskt.toJson();
    await docrmskt.set(json);
  }
}
