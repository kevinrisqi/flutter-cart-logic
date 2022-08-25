import 'package:flutter/cupertino.dart';
import 'package:flutter_interview_test/models/cart_model.dart';
import 'package:flutter_interview_test/models/checkout_model.dart';

import '../services/checkout_service.dart';

class CheckoutProvider with ChangeNotifier {
  // List<CheckoutModel> _checkouts = [];

  // List<CheckoutModel> get checkouts => _checkouts;

  // set checkouts(List<CheckoutModel> checkout) {
  //   _checkouts = checkout;
  //   notifyListeners();
  // }

  Future<void> checkout(int? idVoucher, int nominalDiskon, int nominalPesanan,
      List<CartModel> carts) async {
    try {
      await CheckoutService()
          .checkout(idVoucher, nominalDiskon, nominalPesanan, carts);
    } catch (e) {
      print(e);
    }
  }
}
