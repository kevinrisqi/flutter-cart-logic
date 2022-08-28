// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_interview_test/theme.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: blueColor,
            title: Text('Riwayat Pesanan'),
            centerTitle: true,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: primaryColor,
              ),
              color: bgColor3,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Berhasil')
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/image_food_1.png',
                      width: 75,
                      height: 75,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ayam Krispi',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rp 30000',
                                style: priceTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                'x 1',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2 Menu',
                      style: primaryTextStyle,
                    ),
                    Row(
                      children: [
                        Text('Total Pesanan: ', style: primaryTextStyle,),
                        Text('Rp 13000', style: priceTextStyle,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
