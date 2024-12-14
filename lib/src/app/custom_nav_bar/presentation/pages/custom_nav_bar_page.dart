import 'dart:developer';

import 'package:bek_task/src/app/favorite/presentation/pages/favorite_page.dart';
import 'package:bek_task/src/app/product/presentation/pages/product_page.dart';
import 'package:bek_task/src/app/profile/presentation/pages/profile_page.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBarPage extends StatefulWidget {
  const CustomNavBarPage({Key? key}) : super(key: key);

  @override
  State<CustomNavBarPage> createState() => _CustomNavBarPageState();
}

class _CustomNavBarPageState extends State<CustomNavBarPage> {
  int _currentIndex = 0;

  final List<Widget> _page = [
    ProductPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _page[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2,
              blurRadius: 5,
            )
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (int index) {
                _currentIndex = index;
                setState(() {});
              },
              elevation: 10,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                      color: _currentIndex == 0 ? ColorHelper.buttonColor : ColorHelper.blackColor,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      _currentIndex == 1 ? Icons.favorite : Icons.favorite_border,
                      color: _currentIndex == 1 ? ColorHelper.buttonColor : ColorHelper.blackColor,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      _currentIndex == 2 ? Icons.person_2 : Icons.person_2_outlined,
                      color: _currentIndex == 2 ? ColorHelper.buttonColor : ColorHelper.blackColor,
                    ),
                    label: ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
