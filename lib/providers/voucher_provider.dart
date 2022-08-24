import 'package:flutter/cupertino.dart';
import 'package:flutter_interview_test/models/voucher_model.dart';
import 'package:flutter_interview_test/services/voucher_service.dart';

class VoucherProvider with ChangeNotifier {
  List<VoucherModel> _vouchers = [];
  List<VoucherModel> voucherActive = [
    VoucherModel(id: 0, kode: '', nominal: 1)
  ];

  bool isActiveVoucher = false;

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
    notifyListeners();
  }

  setVoucher(VoucherModel voucher) {
    voucherActive.add(
      VoucherModel(
        id: vouchers.length,
        kode: voucher.kode,
        nominal: voucher.nominal,
      ),
    );
    isActiveVoucher = true;
    notifyListeners();
  }

  resetVoucher() {
    isActiveVoucher = false;
    voucherActive.removeLast();
    notifyListeners();
  }
}
