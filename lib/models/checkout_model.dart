import 'package:flutter_interview_test/models/cart_model.dart';

class CheckoutModel {
  int? idVoucher;
  int? nominalDiskon;
  int? nominalPesanan;
  CartModel? cart;

  CheckoutModel({
    this.idVoucher,
    this.nominalDiskon,
    this.nominalPesanan,
    this.cart,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json){
    return CheckoutModel(
      idVoucher: json['id_voucher']
    );
  }
}
