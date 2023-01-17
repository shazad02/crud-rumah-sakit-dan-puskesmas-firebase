import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 155, 177),
        title: Text(
          'Hai Pendata',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 9 / 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/anim/robo.json"),
              Column(
                children: [
                  Text(
                    "Selamat Datang Di Aplikasi",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 4.5 / 100,
                        color: Color.fromARGB(255, 44, 116, 179),
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Pendataan Rumah Sakit dan Puskesmas",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 3.5 / 100,
                        color: Color.fromARGB(255, 44, 116, 179),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Kawasan Lhoksumawe",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 3.5 / 100,
                        color: Color.fromARGB(255, 44, 116, 179),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    "Ayo Bantu Aku Daftarkan Rumah sakit dan Puskesmas terdekat",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 3 / 100,
                        color: Color.fromARGB(255, 87, 155, 177),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
