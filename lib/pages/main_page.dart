// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/pages/home_page.dart';
import 'package:flutter_interview_test/pages/profile_page.dart';
import 'package:flutter_interview_test/providers/menu_provider.dart';
import 'package:flutter_interview_test/providers/voucher_provider.dart';
import 'package:flutter_interview_test/theme.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    getInit();
    getInit2();
    super.initState();
  }

  getInit() async {
    await Provider.of<MenuProvider>(context, listen: false).getMenus();
  }

  getInit2() async {
    await Provider.of<VoucherProvider>(context, listen: false).getVouchers();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customNavBar() {
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: blueColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 15,
                  right: 30,
                ),
                child: Image.asset(
                  'assets/icon_home.png',
                  width: 21,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 15,
                  left: 30,
                ),
                child: Image.asset(
                  'assets/icon_profile.png',
                  width: 21,
                ),
              ),
              label: '',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return SafeArea(
      child: Scaffold(
        body: body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          backgroundColor: primaryColor,
          child: Image.asset(
            'assets/icon_cart.png',
            color: Colors.white,
            width: 20,
          ),
        ),
        bottomNavigationBar: customNavBar(),
      ),
    );
  }
}
