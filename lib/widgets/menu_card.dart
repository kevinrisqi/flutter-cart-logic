// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/models/menu_model.dart';
import 'package:flutter_interview_test/pages/menu_page.dart';

import '../theme.dart';

class MenuCard extends StatelessWidget {
  MenuModel menu;
  MenuCard({required this.menu, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(
              menu: menu,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor2,
          border: Border.all(
            color: blueColor.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                menu.gambar.toString(),
                width: 75,
                height: 75,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.nama.toString(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Rp ${menu.harga}',
                  style: priceTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
