import 'package:flutter/material.dart';
import 'package:pendataanrumahsakit/screen/dashboard.dart';
import 'package:pendataanrumahsakit/screen/dashboard2.dart';
import 'package:pendataanrumahsakit/screen/home.dart';
import 'package:pendataanrumahsakit/screen/rumah.dart';
import 'package:pendataanrumahsakit/screen/rumah2.dart';

class NavigatorScreen extends StatefulWidget {
  NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int index = 0;
  List<Widget> listPage = [
    HomeScreen(),
    Dash2Screen(),
    Rumah2Screen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listPage[index],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomAppBar(
          color: Colors.black,
          child: BottomNavigationBar(
            elevation: 0,
            iconSize: 35,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.warehouse),
                  activeIcon: Icon(Icons.warehouse),
                  label: 'Puskesmas'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_hospital),
                  activeIcon: Icon(Icons.local_hospital),
                  label: 'Rumah Sakit'),
            ],
            selectedItemColor: Color.fromARGB(255, 87, 155, 177),
            unselectedItemColor: Color.fromARGB(255, 155, 165, 183),
            currentIndex: index,
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
          ),
        ),
      ),
    );
  }
}
