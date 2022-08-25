// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/models/cart_model.dart';
import 'package:flutter_interview_test/models/checkout_model.dart';
import 'package:flutter_interview_test/models/menu_model.dart';
import 'package:flutter_interview_test/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../providers/checkout_provider.dart';
import '../theme.dart';

class CheckoutCard extends StatefulWidget {
  CartModel? cart;

  CheckoutCard({this.cart, Key? key}) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
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
      foregroundDecoration: BoxDecoration(
        color: widget.cart!.quantity == 0 ? Colors.grey : Colors.transparent,
        backgroundBlendMode: widget.cart!.quantity == 0 ? BlendMode.saturation : BlendMode.color,
        
      ),
      decoration: BoxDecoration(
        color: bgColor2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.network(
            widget.cart!.menu!.gambar.toString(),
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
                    widget.cart!.menu!.nama.toString(),
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
                    'Rp ${widget.cart!.menu!.harga}',
                    style: priceTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icon_note.png',
                        width: 13,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        // color: Colors.red,
                        child: Text(
                          widget.cart!.catatan.toString(),
                          maxLines: 2,
                          style: primaryTextStyle.copyWith(
                            fontSize: 11,
                            fontWeight: light,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 1,
                height: 40,
                color: Colors.grey.withOpacity(0.5),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                widget.cart!.quantity.toString(),
                style: priceTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
