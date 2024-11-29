import 'package:flutter/material.dart';
// Import the pages
import 'jilid01.dart';
import 'jilid02.dart';
import 'jilid03.dart';
import 'jilid04.dart';
//import 'tashrif.dart';
//import 'nadzom.dart';
import 'proses.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    List imgData = [
      "assets/img/jilid01.png",
      "assets/img/jilid02.png",
      "assets/img/jilid03.png",
      "assets/img/jilid04.png",
      "assets/img/tashrif.png",
      "assets/img/fathul qrb.png",
    ];

    List titles = [
      "Jilid 1",
      "Jilid 2",
      "Jilid 3",
      "Jilid 4",
      "Tashrif",
      "Baca Kitab",
    ];

    List<Widget> pages = [
      const Jilid01(), // Corresponding page for Jilid 1
      const Jilid02(), // Corresponding page for Jilid 2
      const Jilid03(), // Corresponding page for Jilid 3
      const Jilid04(), // Corresponding page for Jilid 4
      const ProsesPage(), // Corresponding page for Tashrif
      const ProsesPage(), // Corresponding page for Nadzom
    ];

    return Scaffold(
      body: SingleChildScrollView(
        // Wrap the entire body in a single scrollable view
        child: Container(
          color: Colors.indigo,
          width: width,
          //height: height,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                height: height * 0.15,
                width: width,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        top: 10, // Adjusted top padding here
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nadzom Al-Miftah',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Tahap Proses: 29 November 2024',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                width: width,
                padding: const EdgeInsets.only(top: 15),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    mainAxisSpacing: 15,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: imgData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Navigate to the corresponding page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => pages[index],
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              imgData[index],
                              width: 75,
                            ),
                            Text(
                              titles[index],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
