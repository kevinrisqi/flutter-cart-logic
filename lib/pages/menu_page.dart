// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/models/menu_model.dart';
import 'package:flutter_interview_test/providers/cart_provider.dart';
import 'package:flutter_interview_test/theme.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  MenuModel? menu;
  MenuPage({this.menu, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: bgColor1,
      body: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          menu!.gambar.toString(),
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.chevron_left),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          child: Icon(Icons.shopping_bag),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu!.nama.toString(),
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    menu!.tipe.toString(),
                    style: secondaryTextStyle.copyWith(
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: priceTextStyle.copyWith(
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          'Rp ${menu!.harga}',
                          style: priceTextStyle.copyWith(
                            fontWeight: bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Deskripsi',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Salah satu makanan favorit di Indonesia dengan ciri khas rasa pedas yang nikmat. Sehingga cocok untuk dinikmati ketika cuaca dingin atau turun hujan',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cartProvider.addCart(menu!);
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 11,
                        ),
                        child: Text(
                          'Tambah ke Keranjang',
                          style: actionTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
