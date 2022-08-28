import 'dart:convert';

import 'package:flutter_interview_test/models/checkout_model.dart';
import 'package:flutter_interview_test/models/menu_model.dart';
import 'package:http/http.dart' as http;

import '../models/cart_model.dart';

class CheckoutService {
  String baseUrl = 'https://tes-mobile.landa.id/api';

  Future<List<CheckoutModel>> checkout(int? idVoucher, int nominalDiskon,
      int nominalPesanan, List<CartModel> carts, status) async {
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
          cart: carts[0],
          status: status,
        ));
      }

      // transactions.add(CheckoutModel(
      //   id: idTransaction,
      //   idVoucher: idVoucher,
      //   nominalDiskon: nominalDiskon,
      //   nominalPesanan: nominalPesanan,
      //   cart: carts
      //       .map((e) => CartModel(
      //             catatan: e.catatan,
      //             id: e.id,
      //             menu: e.menu,
      //             quantity: e.quantity,
      //           ))
      //       .toList(),
      //   status: status,
      // ));

      return transactions;
    } else {
      throw Exception('Gagal melakukan checkout!');
    }
  }

  Future cancelCheckout(int id) async {
    var url = '$baseUrl/order/cancel/$id';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.post(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      var result = json.encode(response.body);
      return result;
    } else {
      throw Exception('Gagal melakukan pembatalan order !');
    }
  }
}
