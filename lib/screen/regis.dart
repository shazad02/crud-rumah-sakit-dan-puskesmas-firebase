import 'package:flutter/material.dart';
import 'package:pendataanrumahsakit/screen/login.dart';
import 'package:pendataanrumahsakit/screen/navigator.dart';

class RegisScreen extends StatefulWidget {
  RegisScreen({Key? key}) : super(key: key);

  @override
  State<RegisScreen> createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 87, 155, 177),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 2 / 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Daftar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 9 / 100,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 30,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ayo Daftar Sekarang",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 15, 83),
                        fontSize: 23,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(96, 1, 15, 83),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(19, 7, 105, 185),
                          borderRadius: BorderRadius.circular(13)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Color.fromARGB(61, 1, 15, 83),
                            fontWeight: FontWeight.w500,
                          ),
                          hintText: "Daftarkan Emailnya",
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Kata Sandi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(96, 1, 15, 83),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(19, 7, 105, 185),
                          borderRadius: BorderRadius.circular(13)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Color.fromARGB(61, 1, 15, 83),
                            fontWeight: FontWeight.w500,
                          ),
                          hintText: "Buat Kata Sandi",
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ulangi Kata Sandi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(96, 1, 15, 83),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(19, 7, 105, 185),
                          borderRadius: BorderRadius.circular(13)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Color.fromARGB(61, 1, 15, 83),
                            fontWeight: FontWeight.w500,
                          ),
                          hintText: "Ulangi Kata Sandi",
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NavigatorScreen();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 44, 116, 179),
                          minimumSize: Size(double.infinity, 45),
                          maximumSize: Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah Punya Akun?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(192, 92, 164, 235)),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 44, 116, 179)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
