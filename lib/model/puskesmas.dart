class Puskes {
  late String id;
  late final String nama;
  late final String alamat;
  late final int jumlahp;
  late final String fasilitas;

  Puskes({
    this.id = '',
    required this.nama,
    required this.alamat,
    required this.jumlahp,
    required this.fasilitas,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'alamat': alamat,
        'jumlahp': jumlahp,
        'fasilitas': fasilitas,
      };
  static Puskes fromJson(Map<String, dynamic> json) => Puskes(
        id: json['id'],
        nama: json['nama'],
        alamat: json['alamat'],
        jumlahp: json['jumlahp'],
        fasilitas: json['fasilitas'],
      );
}
