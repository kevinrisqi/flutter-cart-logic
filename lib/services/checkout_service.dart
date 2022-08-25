import 'dart:convert';

import 'package:flutter_interview_test/models/checkout_model.dart';
import 'package:http/http.dart' as http;

import '../models/cart_model.dart';

class CheckoutService {
  String baseUrl = 'https://tes-mobile.landa.id/api';

  Future<List<CheckoutModel>> checkout(int? idVoucher, int nominalDiskon,
      int nominalPesanan, List<CartModel> carts) async {
    var url = '$baseUrl/order';
    var headers = {
      'Content-Type': 'application/json',
    };

    var body = jsonEncode({
      'voucher_id': idVoucher,
      'nominal_diskon': nominalDiskon,
      'nominal_pesanan': nominalPesanan,
      'items': carts
          .map((cart) => {
                'id': cart.menu!.id,
                'harga': cart.menu!.harga,
                'catatan': cart.catatan ?? '-',
              })
          .toList()
    });

    print(body);
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      int idTransaction = json.decode(response.body)['id'];
      List<CheckoutModel> transactions = [];

      for (var i = 0; i < carts.length; i++) {
        transactions.add(CheckoutModel(
          id: idTransaction,
          idVoucher: idVoucher,
          nominalDiskon: nominalDiskon,
          nominalPesanan: nominalPesanan,
          cart: carts[i],
        ));
      }

      return transactions;
    } else {
      throw Exception('Gagal melakukan checkout!');
    }
  }
}
