// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/models/menu_model.dart';

import '../theme.dart';

class MenuTile extends StatelessWidget {
  MenuModel? menu;

  MenuTile({this.menu, Key? key}) : super(key: key);

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
          Image.network(
            menu!.gambar,
            width: 75,
            height: 75,
          ),
          SizedBox(
            width: 12,
          ),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu!.nama,
                    style: primaryTextStyle.copyWith(
                      fontSize: 23,
                      fontWeight: medium,
                    ),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Rp ${menu!.harga}',
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
                        'Tambahkan Catatan',
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
          ),
          SizedBox(
            width: 12,
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
