import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MenuModel {
  late int? id;
  late String? nama;
  late int? harga;
  late String? tipe;
  late String? gambar;
  
  MenuModel({
    this.id,
    this.nama,
    this.harga,
    this.tipe,
    this.gambar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'harga': harga,
      'tipe': tipe,
      'gambar': gambar,
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      id: map['id'] as int,
      nama: map['nama'] as String,
      harga: map['harga'] as int,
      tipe: map['tipe'] as String,
      gambar: map['gambar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
