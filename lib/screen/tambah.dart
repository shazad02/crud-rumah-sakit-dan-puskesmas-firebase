import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pendataanrumahsakit/model/puskesmas.dart';
import 'package:pendataanrumahsakit/screen/dashboard.dart';

class TambahScreen extends StatefulWidget {
  TambahScreen({Key? key}) : super(key: key);

  @override
  State<TambahScreen> createState() => _TambahScreenState();
}

class _TambahScreenState extends State<TambahScreen> {
  final controllerNama = TextEditingController();
  final controllerAlamat = TextEditingController();
  final controllerJumlahp = TextEditingController();
  final controllerfasit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 155, 177),
        title: Text('Tambah Data Puskesmas'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: controllerNama,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              labelText: 'Nama Puskemas',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            controller: controllerAlamat,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              labelText: 'Alamat Puskesmas',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            keyboardType: TextInputType.number,
            controller: controllerJumlahp,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              labelText: 'Jumlah Perawat',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            controller: controllerfasit,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              labelText: 'Fasilitas',
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
              final pks = Puskes(
                nama: controllerNama.text,
                alamat: controllerAlamat.text,
                jumlahp: int.parse(controllerJumlahp.text),
                fasilitas: controllerfasit.text,
              );
              createUser(pks);
              Navigator.pop(context);
            },
            child: Text('Tambah Data'),
          )
        ],
      ),
    );
  }

  Future createUser(Puskes puskes) async {
    final docUser = FirebaseFirestore.instance.collection('puskesmas').doc();
    puskes.id = docUser.id;

    final json = puskes.toJson();
    await docUser.set(json);
  }
}
