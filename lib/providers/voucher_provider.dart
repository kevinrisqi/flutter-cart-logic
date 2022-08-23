import 'package:flutter/cupertino.dart';
import 'package:flutter_interview_test/models/voucher_model.dart';
import 'package:flutter_interview_test/services/voucher_service.dart';

class VoucherProvider with ChangeNotifier {
  List<VoucherModel> _vouchers = [];

  List<VoucherModel> get vouchers => _vouchers;

  set vouchers(List<VoucherModel> vouchers) {
    _vouchers = vouchers;
    notifyListeners();
  }

  Future<void> getVouchers() async {
    try {
      List<VoucherModel> vouchers = await VoucherService().getVoucher();
      _vouchers = vouchers;
    } catch (e) {
      print(e);
    }
  }
}
