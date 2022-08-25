import 'package:flutter_interview_test/models/cart_model.dart';

class CheckoutModel {
  late int? id;
  int? idVoucher;
  int? nominalDiskon;
  int? nominalPesanan;
  CartModel? cart;

  CheckoutModel({
    this.id,
    this.idVoucher,
    this.nominalDiskon,
    this.nominalPesanan,
    this.cart,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      id: json['id'],
      idVoucher: json['id_voucher'],
      nominalDiskon: json['nominal_diskon'],
      nominalPesanan: json['nominal_pesanan'],
      cart: CartModel.fromJson(json['cart']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_voucher': idVoucher,
      'nominal_diskon': nominalDiskon,
      'nominal_pesanan': nominalPesanan,
      'items': cart!.toJson(),
    };
  }
}
