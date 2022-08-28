import 'package:flutter_interview_test/models/cart_model.dart';

class CheckoutModel {
  int? id;
  int? idVoucher;
  int? nominalDiskon;
  int? nominalPesanan;
  CartModel? cart;
  String? status;

  CheckoutModel({
    this.id,
    this.idVoucher,
    this.nominalDiskon,
    this.nominalPesanan,
    this.cart,
    this.status,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      id: json['id'],
      idVoucher: json['id_voucher'],
      nominalDiskon: json['nominal_diskon'],
      nominalPesanan: json['nominal_pesanan'],
      cart: CartModel.fromJson(json['cart']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_voucher': idVoucher,
      'nominal_diskon': nominalDiskon,
      'nominal_pesanan': nominalPesanan,
      'items': cart!.toJson(),
      'status': status,
    };
  }
}
