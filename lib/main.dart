// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/theme.dart';
import 'package:flutter_interview_test/widgets/product_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartPage(),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 31),
            child: Column(
              children: [
                ProductTile(
                    image: 'assets/image_food_1.png',
                    name: 'Chicken Katsu',
                    price: 11000,
                    note: 'Pedas dikit, tanpa sayur'),
                ProductTile(
                    image: 'assets/image_food_2.png',
                    name: 'Chicken Slam',
                    price: 9000,
                    note: 'Tambahkan catatan'),
                ProductTile(
                    image: 'assets/image_drink_1.png',
                    name: 'Blue Blood',
                    price: 8000,
                    note: 'Es-nya dikit'),
                ProductTile(
                    image: 'assets/image_drink_2.png',
                    name: 'Dark Chocolate',
                    price: 12000,
                    note: 'Tambahkan catatan'),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: bgColor3,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Total Pesanan',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '(3 Menu) :',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Rp 28.000',
                    style: priceTextStyle.copyWith(
                      fontWeight: bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icon_ticket.png',
                        width: 22,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Voucher',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Input Voucher',
                        style: secondaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: secondaryColor.withOpacity(0.50),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 11,
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: whiteColor,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_cart.png',
                    width: 26,
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Pembayaran',
                          style: secondaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          'Rp 28.000',
                          style: priceTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 11),
                      child: Text(
                        'Pesan Sekarang',
                        style: actionTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
