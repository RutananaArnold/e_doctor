import 'package:e_doctor/controllers/auth_controller.dart';
import 'package:e_doctor/controllers/menu_controller.dart';
import 'package:e_doctor/screens/patient%20screens/book_test.dart';
import 'package:e_doctor/screens/patient%20screens/consult_doctor.dart';
import 'package:e_doctor/screens/patient%20screens/help.dart';
import 'package:e_doctor/screens/patient%20screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 180,
      child: GetBuilder<MenuController>(
          init: MenuController(),
          builder: (menuCtrol) {
            return ListView(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.red[100],
                    foregroundImage:
                        const AssetImage("assets/images/demoLogo.png"),
                  ),
                  accountName: Text(
                    authContrler.userProfile[0].userName,
                    style: const TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    authContrler.userProfile[0].email,
                    style: const TextStyle(color: Colors.black),
                  ),
                  decoration: const BoxDecoration(color: Colors.white),
                ),
                authContrler.userProfile[0].role == 'patient'
                    ? DrawerListTile(
                        title: "Consult a Doctor",
                        svgSrc: Icons.medication,
                        press: () {
                          menuCtrol.openCloseDrawer(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const ConsultDoctor())),
                              (route) => true);
                        })
                    : Container(),
                authContrler.userProfile[0].role == 'patient'
                    ? DrawerListTile(
                        title: "Book a Test",
                        svgSrc: Icons.book,
                        press: () {
                          menuCtrol.openCloseDrawer(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: ((context) => const BookTest())),
                              (route) => true);
                        })
                    : Container(),
                DrawerListTile(
                    title: "Help",
                    svgSrc: Icons.help,
                    press: () {
                      menuCtrol.openCloseDrawer(context);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: ((context) => const Help())),
                          (route) => true);
                    }),
                DrawerListTile(
                    title: "Profile",
                    svgSrc: Icons.person,
                    press: () {
                      menuCtrol.openCloseDrawer(context);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: ((context) => const Profile())),
                          (route) => true);
                    }),
              ],
            );
          }),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        svgSrc,
        color: Colors.black,
        size: MediaQuery.of(context).size.height / 42,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 11.5),
      ),
    );
  }
}
