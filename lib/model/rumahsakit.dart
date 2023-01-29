class RmSkt {
  late String id;
  late final String nama;
  late final String alamat;
  late final int jumlahdc;
  late final int jumlahkuota;
  late final String maplks;

  RmSkt({
    this.id = '',
    required this.nama,
    required this.alamat,
    required this.jumlahdc,
    required this.jumlahkuota,
    required this.maplks,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'alamat': alamat,
        'jumlahdc': jumlahdc,
        'jumlahkuota': jumlahkuota,
        'maplks': maplks,
      };
  static RmSkt fromJson(Map<String, dynamic> json) => RmSkt(
        id: json['id'],
        nama: json['nama'],
        alamat: json['alamat'],
        jumlahdc: json['jumlahdc'],
        jumlahkuota: json['jumlahkuota'],
        maplks: json['maplks'],
      );
}
