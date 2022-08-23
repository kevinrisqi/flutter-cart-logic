class VoucherModel {
  int? id;
  String? kode;
  int? nominal;

  VoucherModel({
    this.id,
    this.kode,
    this.nominal,
  });

  factory VoucherModel.fromJson(Map<String, dynamic> json) {
    return VoucherModel(
      id: json['id'],
      kode: json['kode'],
      nominal: json['nominal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode': kode,
      'nominal': nominal,
    };
  }
}
