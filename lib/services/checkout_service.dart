import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/cart_model.dart';

class CheckoutService {
  String baseUrl = 'https://tes-mobile.landa.id/api';

  Future<bool> checkout(int? idVoucher, int nominalDiskon, int nominalPesanan,
      List<CartModel> carts) async {
    var url = '$baseUrl/orders';
    var headers = {
      'Content-Type': 'application/json',
    };

    var body = jsonEncode({
      'voucher_id': idVoucher,
      'nominal_diskon': nominalDiskon,
      'nominal_pesanan': nominalPesanan,
      'items': carts.map((cart) => {
            'id': cart.menu!.id,
            'harga': cart.menu!.harga,
            'catatan': cart.catatan,
          })
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal melakukan checkout!');
    }
  }
}
