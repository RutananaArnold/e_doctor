import 'package:e_doctor/controllers/menu_controller.dart';
import 'package:e_doctor/screens/appointments.dart';
import 'package:e_doctor/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Index extends StatefulWidget {
  int currentTabIndex;
  Index({Key? key, this.currentTabIndex = 0}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  void onItemTapped(int index) {
    setState(() {
      widget.currentTabIndex = index;
    });
  }

  List<Widget> tabs = const [Home(), Appointments()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: menuContlr.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      drawer: const SideMenu(),
      body: tabs[widget.currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentTabIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Appointments", icon: Icon(Icons.date_range))
        ],
        selectedItemColor: Colors.green,
      ),
    );
  }
}
