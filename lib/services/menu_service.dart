import 'dart:convert';

import 'package:flutter_interview_test/models/menu_model.dart';
import 'package:http/http.dart' as http;

class MenuService {
  String baseUrl = 'https://tes-mobile.landa.id/api';

  Future<List<MenuModel>> getMenu() async {
    var url = '$baseUrl/menus';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    // print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['datas'];
      List<MenuModel> menus = [];

      for (var item in data) {
        menus.add(MenuModel.fromMap(item));
      }

      return menus;
    } else {
      throw Exception('Data menus can\'t be load');
    }
  }
}
