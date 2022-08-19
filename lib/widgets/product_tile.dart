// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme.dart';

class ProductTile extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final String note;

  const ProductTile(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.note})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      margin: EdgeInsets.only(bottom: 18, right: 25, left: 25),
      padding: EdgeInsets.only(
        left: 7,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
          color: bgColor2, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 75,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: primaryTextStyle.copyWith(
                    fontSize: 23,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Rp $price',
                  style: priceTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon_note.png',
                      width: 13,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      note,
                      style: primaryTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/button_add.png',
                width: 20,
              ),
              SizedBox(
                width: 11,
              ),
              Text(
                '1',
                style: primaryTextStyle,
              ),
              SizedBox(
                width: 11,
              ),
              Image.asset(
                'assets/button_min.png',
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
