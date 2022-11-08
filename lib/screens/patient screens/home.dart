import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_doctor/controllers/auth_controller.dart';
import 'package:e_doctor/controllers/doctor_booking_controller.dart';
import 'package:e_doctor/controllers/doctors_controller.dart';
import 'package:e_doctor/screens/doctor%20screens/doctors_home.dart';
import 'package:e_doctor/screens/patient%20screens/doctor_infor.dart';
import 'package:e_doctor/screens/patient%20screens/symptom_page.dart';
import 'package:e_doctor/widgets/doctors_card.dart';
import 'package:e_doctor/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> imageurls = [
    "assets/images/checkup.jpg",
    "assets/images/counsel.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (user) {
          return user.userProfile[0].role == 'patient'
              ? ListView(
                  children: [
                    // sliders part
                    Container(
                      height: size.height * 0.32,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: SizedBox(
                        height: size.height * 0.3,
                        width: size.width * 0.95,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CarouselSlider.builder(
                                itemCount: imageurls.length,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    Container(
                                  margin: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: AssetImage(imageurls[itemIndex]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                //Slider Container properties
                                options: CarouselOptions(
                                  height: 180.0,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  viewportFraction: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: size.height * 0.02),
                            child: const Text(
                              "Disease diagnosis using your symptoms ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // categories part
                    SizedBox(
                      height: size.height * 0.15,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Center(
                          child: RoundedButton(
                              text: "Click to enter symptoms",
                              press: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const CategoryPage()),
                                    (Route<dynamic> route) => true);
                              },
                              color: Colors.greenAccent),
                        ),
                      ),
                    ),

                    // top doctors part
                    SizedBox(
                      height: size.height * 0.03,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: size.height * 0.02),
                            child: const Text(
                              "Top Doctors ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.5,
                          ),
                          InkWell(
                            child: const Text(
                              "View All",
                              style: TextStyle(color: Colors.green),
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: GetBuilder<DoctorController>(
                              init: DoctorController(),
                              builder: (doctors) {
                                return Row(
                                    children: List.generate(
                                        doctors.doctorsList.length,
                                        (index) => doctors
                                                    .doctorsList[index].role !=
                                                'doctor'
                                            ? const Text(" ")
                                            : DoctorCard(
                                                doctorName: doctors
                                                    .doctorsList[index]
                                                    .userName,
                                                onTap: () {
                                                  doctorBookingControl
                                                      .changeDoctor(doctors
                                                          .doctorsList[index]
                                                          .userName);
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  ((context) =>
                                                                      DoctorInfor(
                                                                        doctorDetail: [
                                                                          doctors
                                                                              .doctorsList[index]
                                                                        ],
                                                                      ))),
                                                          (route) => true);
                                                },
                                              )));
                              })),
                    ),
                  ],
                )
              : const DoctorsHome();
        });
  }
}
