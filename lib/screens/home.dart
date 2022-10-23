import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_doctor/widgets/category_card.dart';
import 'package:e_doctor/widgets/doctors_card.dart';
import 'package:e_doctor/widgets/symptom_card.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: ListView(
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
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
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
                    "Categories ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
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
          // categories part
          SizedBox(
            height: size.height * 0.15,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(6, (index) => const CategoryCard())),
            ),
          ),
          // symptoms part
          SizedBox(
            height: size.height * 0.03,
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.height * 0.02),
                  child: const Text(
                    "Symptoms ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
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
              child: Row(
                  children: List.generate(5, (index) => const SymptomCard())),
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
                        fontWeight: FontWeight.bold, color: Colors.black),
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
              child: Row(
                  children: List.generate(5, (index) => const DoctorCard())),
            ),
          ),
        ],
      ),
    );
  }
}
