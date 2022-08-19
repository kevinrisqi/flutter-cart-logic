// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/product_tile.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _voucher = TextEditingController();

  bool isInputVoucher = false;

  @override
  Widget build(BuildContext context) {
    Widget checkoutButton() {
      return Container(
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isInputVoucher = true;
                      });
                    },
                    child: Row(
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
                    ),
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
      );
    }

    Widget voucherInput() {
      return Container(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          top: 20,
        ),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icon_ticket.png',
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Punya kode voucher?',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              'Masukkan kode voucher disini',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              child: TextFormField(
                controller: _voucher,
                style: secondaryTextStyle.copyWith(fontSize: 13),
                decoration: InputDecoration(
                  hintStyle: secondaryTextStyle.copyWith(fontSize: 13),
                  hintText: 'puas',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isInputVoucher = false;
                      });
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: secondaryColor.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 40,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Validasi Voucher',
                    style: actionTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

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
                  note: 'Pedas dikit, tanpa sayur',
                ),
                ProductTile(
                  image: 'assets/image_food_2.png',
                  name: 'Chicken Slam',
                  price: 9000,
                  note: 'Tambahkan catatan',
                ),
                ProductTile(
                  image: 'assets/image_drink_1.png',
                  name: 'Blue Blood',
                  price: 8000,
                  note: 'Es-nya dikit',
                ),
                ProductTile(
                  image: 'assets/image_drink_2.png',
                  name: 'Dark Chocolate',
                  price: 12000,
                  note: 'Tambahkan catatan',
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: isInputVoucher ? voucherInput() : checkoutButton(),
    );
  }
}
