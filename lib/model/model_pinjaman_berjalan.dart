part of 'model.dart';

class PinjamanBerjalan {
  String docNo;
  String docDate;
  String statusBayar;
  String statusPencairan;
  String nik;
  String noAnggota;
  String nama;
  String gajiPokok;
  String tglTempo;
  String jenisPinjaman;
  String planPinjaman;
  String actualPinjaman;
  String planAngsuran;
  String totalPotongan;
  String planJangkaWaktu;
  String actualJangkaWaktu;
  String awalPinjaman;
  String totalPinjaman;
  String sisaPinjaman;
  String jumlahAngsuran;
  String angsuranBerjalan;

  PinjamanBerjalan(
    this.docNo, 
    this.docDate,
    this.statusBayar,
    this.statusPencairan,
    this.tglTempo,
    this.jenisPinjaman,
    this.planPinjaman,
    this.actualPinjaman, 
    this.planAngsuran,
    this.totalPotongan,
    this.planJangkaWaktu,
    this.actualJangkaWaktu,
    this.awalPinjaman,
    this.totalPinjaman,
    this.sisaPinjaman,
    this.jumlahAngsuran,
    this.angsuranBerjalan,
  );

  factory PinjamanBerjalan.initial() => PinjamanBerjalan(
    '','','','','','','','','','','','','','','','','',
  );

  factory PinjamanBerjalan.fromJSON(Map<String, dynamic> data) => PinjamanBerjalan(
    data['doc_no'] as String,
    data['doc_date'] as String,
    data['status_bayar'] as String,
    data['status_pencairan'] as String,
    data['tgl_tempo'] as String,
    data['jenis_pinjaman'] as String,
    data['plan_pinjaman'] as String,
    data['actual_pinjaman'] as String,
    data['plan_angsuran'] as String,
    data['total_potongan'] as String,
    data['plan_jangka_waktu'] as String,
    data['actual_jangka_waktu'] as String,
    data['awal_pinjaman'] as String,
    data['total_pinjaman'] as String,
    data['sisa_pinjaman'] as String,
    data['jumlah_angsuran'] as String,
    data['angsuran_berjalan'] as String,
  );
}
