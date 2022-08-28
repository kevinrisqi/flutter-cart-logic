// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter_interview_test/models/checkout_model.dart';

import '../theme.dart';

class HistoryCard extends StatelessWidget {
  CheckoutModel? checkout;

  HistoryCard({
    Key? key,
    this.checkout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        right: 30,
        left: 30,
        bottom: 30,
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
              Text('Berhasil'),
            ],
          ),
          Row(
            children: [
              Image.network(
                checkout!.cart!.menu!.gambar.toString(),
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
                      checkout!.cart!.menu!.nama.toString(),
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
                          'Rp ${checkout!.cart!.menu!.harga}',
                          style: priceTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'x ${checkout!.cart!.quantity}',
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
                '${checkout!.cart!.quantity} Menu',
                style: primaryTextStyle,
              ),
              Row(
                children: [
                  Text(
                    'Total Pesanan: ',
                    style: primaryTextStyle,
                  ),
                  Text(
                    'Rp ${checkout!.nominalPesanan}',
                    style: priceTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
