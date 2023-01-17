class RmSkt {
  late String id;
  late final String nama;
  late final String alamat;
  late final int jumlahdc;
  late final int jumlahkuota;

  RmSkt({
    this.id = '',
    required this.nama,
    required this.alamat,
    required this.jumlahdc,
    required this.jumlahkuota,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'alamat': alamat,
        'jumlahdc': jumlahdc,
        'jumlahkuota': jumlahkuota,
      };
  static RmSkt fromJson(Map<String, dynamic> json) => RmSkt(
        id: json['id'],
        nama: json['nama'],
        alamat: json['alamat'],
        jumlahdc: json['jumlahdc'],
        jumlahkuota: json['jumlahkuota'],
      );
}
