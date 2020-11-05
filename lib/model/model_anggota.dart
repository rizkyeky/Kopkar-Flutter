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
}