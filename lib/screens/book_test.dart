import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_doctor/screens/generic_test.dart';
import 'package:e_doctor/screens/specialised_test.dart';
import 'package:flutter/material.dart';

class BookTest extends StatefulWidget {
  const BookTest({super.key});

  @override
  State<BookTest> createState() => _BookTestState();
}

class _BookTestState extends State<BookTest> {
  late List<String> imageurls = [
    "assets/images/checkup.jpg",
    "assets/images/counsel.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Positioned(
              top: size.height * 0.003,
              child: SizedBox(
                height: size.height * 0.3,
                width: size.width * 0.95,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          const Text(
                            "Package Health Checkup",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            width: size.width * 0.09,
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
              )),
          Positioned(
            top: size.height * 0.35,
            child: SizedBox(
              height: size.height * 0.9,
              width: size.width * 0.97,
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TabBar(
                        labelColor: Colors.black,
                        indicatorColor: Colors.green,
                        onTap: (index) {},
                        tabs: const [
                          Tab(text: 'Generic Test'),
                          Tab(text: 'Specialized Test'),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 12,
                      child: TabBarView(
                        children: [
                          GenericTest(),
                          SpecialisedTest(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
