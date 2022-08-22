// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/theme.dart';
import 'package:flutter_interview_test/widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              bottom: 30,
            ),
            child: Text(
              'Menu Pilihan',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: bold,
              ),
            ),
          ),
          Column(
            children: [
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
              MenuCard(),
            ],
          )
        ],
      ),
    );
  }
}
