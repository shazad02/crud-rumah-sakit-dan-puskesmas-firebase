import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pendataanrumahsakit/screen/tambah.dart';

class Dash2Screen extends StatefulWidget {
  Dash2Screen({Key? key}) : super(key: key);

  @override
  State<Dash2Screen> createState() => _Dash2ScreenState();
}

class _Dash2ScreenState extends State<Dash2Screen> {
  final CollectionReference _puskes =
      FirebaseFirestore.instance.collection('puskesmas');

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _jumlahpController = TextEditingController();
  final TextEditingController _fasihController = TextEditingController();
  Future _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _namaController.text = documentSnapshot['nama'];
      _alamatController.text = documentSnapshot['alamat'];
      _jumlahpController.text = documentSnapshot['jumlahp'].toString();
      _fasihController.text = documentSnapshot['fasilitas'];
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
                    labelText: 'Nama Puskesmas',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _alamatController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Alamat Puskesmas',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _jumlahpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Jumlah Perawat Puskesmas',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _fasihController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: 'Fasilitas Puskesmas',
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
                        final String alamat = _alamatController.text;
                        final int jumlahp = int.parse(_jumlahpController.text);
                        final String fasilitas = _fasihController.text;

                        if (nama != null) {
                          await _puskes.doc(documentSnapshot!.id).update({
                            "nama": nama,
                            "alamat": alamat,
                            "jumlahp": jumlahp,
                            "fasilitas": fasilitas
                          });
                          _namaController.text = '';
                          _alamatController.text = '';
                          _jumlahpController.text = '';
                          _fasihController.text = '';
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
        automaticallyImplyLeading: false,
        title: Text('Data Puskesmas Lhoksumawe'),
        backgroundColor: Color.fromARGB(255, 87, 155, 177),
      ),
      body: StreamBuilder(
        stream: _puskes.snapshots(),
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
                                  'Puskesmas',
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
                                'Jumlah Perawat: ',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            3.8 /
                                            100,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 87, 155, 177)),
                              ),
                              Text(
                                documentSnapshot['jumlahp'].toString(),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fasilitas: ',
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
                                documentSnapshot['fasilitas'],
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
                                    .collection('puskesmas')
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
            return TambahScreen();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
