part of 'model.dart';

class Anggota {
  String id;
  String nikKar;
  String namaKar;
  String email;
  String noTelp;
  String simWajib;
  String simPokok;
  String gaji;
  bool batasPinjaman;

  Anggota(this.id, this.nikKar, {
    this.namaKar,
    this.email, 
    this.gaji,
    this.noTelp,
    this.simPokok,
    this.simWajib,
    this.batasPinjaman,
  });

  factory Anggota.initial() => Anggota(
    '', '',
    namaKar: '',
    email: '',
    noTelp: '',
    gaji: '0',
    simPokok: '0',
    simWajib: '0',
    batasPinjaman: false,
  );

  factory Anggota.fromJSON(Map<String, dynamic> data) => Anggota(
    (data['id'] as num).toString(),
    data['nik_kar'] as String,
    namaKar: data['nama_kar'] as String,
    email: data['email'] as String,
    noTelp: data['no_telp'] as String,
    simPokok: data['sim_pokok'] as String,
    simWajib: data['sim_wajib'] as String,
    gaji: data['gaji'] as String,
    batasPinjaman: data['batas_pinjaman'] as bool
  );

  factory Anggota.duplicate(Anggota anggota) => Anggota(
    anggota.id,
    anggota.nikKar,
    namaKar: anggota.namaKar,
    email: anggota.email,
    noTelp: anggota.noTelp,
    simWajib: anggota.simWajib,
    simPokok: anggota.simPokok,
    gaji: anggota.gaji,
    batasPinjaman: anggota.batasPinjaman,
  );
  
  void duplicate(Anggota anggota) {
    id = anggota.id;
    nikKar = anggota.nikKar;
    namaKar = anggota.namaKar;
    email = anggota.email;
    noTelp = anggota.noTelp;
    simWajib = anggota.simWajib;
    simPokok = anggota.simPokok;
    gaji = anggota.gaji;
    batasPinjaman = anggota.batasPinjaman;

  }

  void copyWith({
    String namaKar,
    String email,
    String noTelp,
    String simWajib,
    String simPokok,
    String gaji,
    bool batasPinjaman,
  }) {
    this.namaKar = namaKar ?? this.namaKar;
    this.email = email ?? this.email;
    this.noTelp = noTelp ?? this.noTelp;
    this.simWajib = simWajib ?? this.simWajib;
    this.simPokok = simPokok ?? this.simPokok;
    this.gaji = gaji ?? this.gaji;
    this.batasPinjaman = batasPinjaman ?? this.batasPinjaman;
  }

  factory Anggota.fromLocal(List<String> data) => Anggota(
    data[0],
    data[1],
    namaKar: data[2],
    email: data[3],
    noTelp: data[4],
    simWajib: data[5],
    simPokok: data[6],
    gaji: data[7],
    batasPinjaman: data[8] == 'true',
  );

  List<String> get toLocal => [
    id, 
    nikKar, 
    namaKar,
    email, 
    gaji,
    noTelp,
    simPokok,
    simWajib,
    batasPinjaman.toString(),
  ];
}