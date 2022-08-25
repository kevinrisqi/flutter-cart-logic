// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/models/cart_model.dart';
import 'package:flutter_interview_test/providers/cart_provider.dart';
import 'package:flutter_interview_test/providers/checkout_provider.dart';
import 'package:flutter_interview_test/providers/voucher_provider.dart';
import 'package:provider/provider.dart';

import '../providers/menu_provider.dart';
import '../theme.dart';
import '../widgets/cart_card.dart';

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
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    VoucherProvider voucherProvider = Provider.of<VoucherProvider>(context);
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);

    handleCheckout() async {
      int? idVoucher = voucherProvider.voucherActive.last.id;
      int? diskon = voucherProvider.voucherActive.last.nominal;
      int totalPrice =
          cartProvider.totalPrice(voucherProvider.voucherActive.last);
      List<CartModel> carts = cartProvider.carts;
      await checkoutProvider.checkout(idVoucher, diskon!, totalPrice, carts);
      print(checkoutProvider.checkouts.last.cart!.menu!.nama);
    }

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
                        '(${cartProvider.totalItems().toString()} Menu) :',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Rp ${cartProvider.subTotalPrice().toString()}',
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
            GestureDetector(
              onTap: () {
                setState(() {
                  isInputVoucher = true;
                });
              },
              child: Padding(
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
                        voucherProvider.isActiveVoucher
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    voucherProvider.voucherActive.last.kode
                                        .toString(),
                                    style: secondaryTextStyle.copyWith(
                                      fontWeight: light,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    'Rp ${voucherProvider.voucherActive.last.nominal}',
                                    style: secondaryTextStyle.copyWith(
                                      fontSize: 13,
                                      fontWeight: light,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
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
                          'Rp ${cartProvider.totalPrice(voucherProvider.voucherActive.last)}',
                          style: priceTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      handleCheckout();
                    },
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
                  hintStyle: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    color: secondaryColor.withOpacity(0.4),
                  ),
                  hintText: 'puas',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        voucherProvider.resetVoucher();
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
                onPressed: () {
                  List voucher = [];
                  voucherProvider.vouchers.map((item) {
                    voucher.add(item);
                  }).toList();
                  if (voucher.indexWhere(
                          (element) => element.kode == _voucher.text) ==
                      -1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        backgroundColor: alertColor,
                        content: Text(
                          'Maaf, kode voucher yg Anda masukkan salah!',
                          style: secondaryTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                    print('Maaf, kode voucher yg Anda masukkan salah!');
                  } else {
                    int index = voucher
                        .indexWhere((element) => element.kode == _voucher.text);
                    print('Kode ${voucher[index].kode}');
                    voucherProvider.setVoucher(voucher[index]!);
                    isInputVoucher = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        backgroundColor: primaryColor,
                        content: Text(
                          'Voucher berhasil digunakan!',
                          style: secondaryTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                },
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
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
            color: Colors.white,
          ),
        ),
        backgroundColor: blueColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 31),
            child: Column(
              children: cartProvider.carts
                  .map((cart) => CartCard(cart: cart))
                  .toList(),
            ),
          )
        ],
      ),
      bottomNavigationBar: isInputVoucher ? voucherInput() : checkoutButton(),
    );
  }
}
