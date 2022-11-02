import 'package:flutter/material.dart';
import 'package:project_flutter/pages/second_page.dart';
import 'main_page.dart';
import 'third_page.dart';
import 'fourth_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int pageIndex = 0;
  final pages = [
    const MainPage(),
    const SecondPage(),
    const ThirdPage(),
    const FourthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "BottomExample",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              pageIndex = 0;
            });
          },
          icon: pageIndex == 0
              ? const Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 35,
              )
            : const Icon(
                Icons.home_outlined,
                color: Colors.grey,
                size: 35,
                ),
      ),
      IconButton(
        onPressed:() {
          setState(() {
            pageIndex = 1;
          });
        },
        icon: pageIndex == 1
              ? const Icon(
                  Icons.work_rounded,
                  color: Colors.white,
                  size: 35,
                )
              : const Icon(
                  Icons.work_rounded,
                  color: Colors.white,
                  size: 35,
                ),
        ),
      ]
    ),
   );
  }
}
