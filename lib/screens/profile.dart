import 'package:e_doctor/controllers/auth_controller.dart';
import 'package:e_doctor/widgets/profile_tile.dart';
import 'package:e_doctor/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List user = [
    {"name": "Gender", "text": "gender"},
    {"name": "Date Of Birth", "text": "dob"},
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(children: [
          //top card
          Transform.rotate(
            angle: (60 / 180),
            origin: Offset(size.width * 2.4, size.height * -0.1),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: size.height * 0.65,
              width: size.height * 0.65,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(200),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: size.height * 0.003,
            right: 0,
            // bottom: size.height * 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PhysicalModel(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(200),
                        clipBehavior: Clip.antiAlias,
                        elevation: 10,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.red[100],
                          foregroundImage:
                              const AssetImage("assets/images/demoLogo.png"),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        authContrler.userProfile[0].userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        authContrler.userProfile[0].email,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Column(
                        children: List.generate(
                          user.length,
                          (index) => ProfileTile(
                              padding: 20,
                              label: user[index]['name'],
                              value: user[index]['text']),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.00003,
            child: RoundedButton(
                text: "SignOut",
                press: () {
                  // signingout();
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: ((context) => const AuthGate())),
                  //     (route) => true);
                },
                color: Colors.green),
          )
        ]),
      ),
    );
  }
}
