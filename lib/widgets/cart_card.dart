// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/models/cart_model.dart';
import 'package:flutter_interview_test/models/menu_model.dart';
import 'package:flutter_interview_test/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class CartCard extends StatefulWidget {
  CartModel? cart;

  CartCard({this.cart, Key? key}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  final TextEditingController _catatan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
                        child: TextFormField(
                          onChanged: (value) {
                            cartProvider.addNote(value, widget.cart!.id!);
                            print('${widget.cart!.id}');
                          },
                          controller: _catatan,
                          maxLines: 2,
                          style: primaryTextStyle.copyWith(
                              fontSize: 11,
                              fontWeight: light,
                              color: Colors.grey),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Tambahkan Catatan',
                            hintStyle: primaryTextStyle.copyWith(
                              fontSize: 11,
                              fontWeight: light,
                            ),
                          ),
                        ),
                      ),
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
              GestureDetector(
                onTap: () {
                  cartProvider.addQuantity(widget.cart!.id!);
                },
                child: Image.asset(
                  'assets/button_add.png',
                  width: 20,
                ),
              ),
              SizedBox(
                width: 11,
              ),
              Text(
                widget.cart!.quantity.toString(),
                style: primaryTextStyle,
              ),
              SizedBox(
                width: 11,
              ),
              GestureDetector(
                onTap: () {
                  cartProvider.minQuantity(widget.cart!.id!);
                },
                child: Image.asset(
                  'assets/button_min.png',
                  width: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
