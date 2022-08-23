import 'package:flutter_interview_test/models/menu_model.dart';

class CartModel {
  int? id;
  MenuModel? menu;
  int? quantity;

  CartModel({
    this.id,
    this.menu,
    this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int,
      menu: MenuModel.fromMap(json['menu']),
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu': menu!.toJson(),
      'quantity': quantity,
    };
  }

  int getTotalPrice() {
    return int.parse(menu!.harga.toString()) * quantity!;
  }
}
