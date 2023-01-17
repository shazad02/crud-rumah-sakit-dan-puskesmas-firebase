import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pendataanrumahsakit/screen/tambah2.dart';

class Rumah2Screen extends StatefulWidget {
  Rumah2Screen({Key? key}) : super(key: key);

  @override
  State<Rumah2Screen> createState() => _Rumah2ScreenState();
}

class _Rumah2ScreenState extends State<Rumah2Screen> {
  final CollectionReference _rm =
      FirebaseFirestore.instance.collection('rumahsakits');

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamtController = TextEditingController();
  final TextEditingController _jumlahdcController = TextEditingController();
  final TextEditingController _jumlahktController = TextEditingController();

  Future _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _namaController.text = documentSnapshot['nama'];
      _alamtController.text = documentSnapshot['alamat'];
      _jumlahdcController.text = documentSnapshot['jumlahdc'].toString();
      _jumlahktController.text = documentSnapshot['jumlahkuota'].toString();
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Nama Rumah Sakit',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _alamtController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Alamat Rumah Sakit',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _jumlahdcController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Jumlah Kuota Pasien IGD',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _jumlahktController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Jumlah Kuota Pasien IGD',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 116, 179),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        final String nama = _namaController.text;
                        final String alamat = _alamtController.text;
                        final int jumlahdc =
                            int.parse(_jumlahdcController.text);
                        final int jumlahkuota =
                            int.parse(_jumlahktController.text);

                        if (nama != null) {
                          await _rm.doc(documentSnapshot!.id).update({
                            "nama": nama,
                            "alamat": alamat,
                            "jumlahdc": jumlahdc,
                            "jumlahkuota": jumlahkuota
                          });
                          _namaController.text = '';
                          _alamtController.text = '';
                          _jumlahdcController.text = '';
                          _jumlahktController.text = '';
                        }
                        Navigator.pop(context);
                      },
                      child: Text('Update'),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Data Rumah Sakit Lhoksumawe'),
        backgroundColor: Color.fromARGB(255, 87, 155, 177),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: _rm.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  color: Color.fromARGB(255, 234, 253, 252),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rumah Sakit',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              3 /
                                              100,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 87, 155, 177)),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  documentSnapshot['nama'],
                                  maxLines: 100,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              7 /
                                              100,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 44, 116, 179)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alamat:',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              4 /
                                              100,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 87, 155, 177)),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  child: Text(
                                    documentSnapshot['alamat'],
                                    maxLines: 100,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                4.5 /
                                                100,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 44, 116, 179)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 4 / 100,
                          ),
                          Row(
                            children: [
                              Text(
                                'Jumlah Dokter: ',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            3.8 /
                                            100,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 87, 155, 177)),
                              ),
                              Text(
                                documentSnapshot['jumlahdc'].toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            3.8 /
                                            100,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 44, 116, 179)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jumlah Kuota Pasien IGD: ',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            4 /
                                            100,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 87, 155, 177)),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                documentSnapshot['jumlahkuota'].toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            4 /
                                            100,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 44, 116, 179)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                _update(documentSnapshot);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                final docUser = FirebaseFirestore.instance
                                    .collection('rumahsakits')
                                    .doc(documentSnapshot.id);

                                //update
                                docUser.delete();
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 44, 116, 179),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TambahRumah();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
