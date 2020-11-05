part of 'model.dart';

class Anggota {
  String idCar;
  String nama;
  String email;
  String jenisKel;
  String alamat;
  String noTelp;
  bool statusAnggota;
  int simWajib;
  int simPokok;
  int gaji;
  int batasPinjaman;

  Anggota(this.idCar, this.nama, {
    this.email, 
    this.alamat,
    this.statusAnggota,
    this.gaji,
    this.jenisKel,
    this.noTelp,
    this.simPokok,
    this.simWajib,
    this.batasPinjaman,
  });

  factory Anggota.initial() => Anggota(
    '', '',
    email: '',
    alamat: '',
    statusAnggota: false,
    jenisKel: '',
    noTelp: '',
    gaji: 0,
    simPokok: 0,
    simWajib: 0,
    batasPinjaman: 0,
  );

  factory Anggota.fromJSON(Map<String, dynamic> data) => Anggota(
    data['id_card'] as String,
    data['nama'] as String,
    email: data['email'] as String,
    jenisKel: data['jenis_kel'] as String,
    alamat: data['alamat'] as String,
    noTelp: data['no_telp'] as String,
    statusAnggota: data['status_anggota'] == 'AKTIVE',
    simPokok: (data['sim_pokok'] as num).toInt(),
    simWajib: (data['sim_wajib'] as num).toInt(),
    gaji: (data['gaji'] as num).toInt(),
    batasPinjaman: (data['batas_pinjaman'] as num).toInt()
  );

  void duplicate(Anggota anggota) {
    idCar = anggota.idCar;
    nama = anggota.nama;
    email = anggota.email;
    jenisKel = anggota.jenisKel;
    alamat = anggota.alamat;
    noTelp = anggota.noTelp;
    statusAnggota = anggota.statusAnggota;
    simWajib = anggota.simWajib;
    simPokok = anggota.simPokok;
    gaji = anggota.gaji;
    batasPinjaman = anggota.batasPinjaman;
  }

  void copyWith({
    String idCar,
    String nama,
    String email,
    String jenisKel,
    String alamat,
    String noTelp,
    bool statusAnggota,
    int simWajib,
    int simPokok,
    int gaji,
    int batasPinjaman,
  }) {
    this.idCar = idCar ?? this.idCar;
    this.nama = nama ?? this.nama;
    this.email = email ?? this.email;
    this.jenisKel = jenisKel ?? this.jenisKel;
    this.alamat = alamat ?? this.alamat;
    this.noTelp = noTelp ?? this.noTelp;
    this.statusAnggota = statusAnggota ?? this.statusAnggota;
    this.simWajib = simWajib ?? this.simWajib;
    this.simPokok = simPokok ?? this.simPokok;
    this.gaji = gaji ?? this.gaji;
    this.batasPinjaman = batasPinjaman ?? this.batasPinjaman;
  }
}