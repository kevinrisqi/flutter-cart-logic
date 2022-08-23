import 'dart:convert';

import 'package:flutter_interview_test/models/voucher_model.dart';
import 'package:http/http.dart' as http;

class VoucherService {
  String baseUrl = 'https://tes-mobile.landa.id/api';

  Future<List<VoucherModel>> getVoucher() async {
    var url = '$baseUrl/vouchers';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['datas'];
      List<VoucherModel> vouchers = [];

      for (var element in data) {
        vouchers.add(VoucherModel.fromJson(element));
      }

      return vouchers;
    } else {
      throw Exception('Data can\t be load');
    }
  }
}
