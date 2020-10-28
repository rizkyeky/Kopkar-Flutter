part of 'page.dart';

class HistoryPage extends Page<HistoryBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  final List<String> _options = [
    'Riwayat Pembelian Toko',
    'Riwayat PPBO',
    'Riwayat Pinjaman',
    'Riwayat Potongan Bulanan',
    'Riwayat SHU',
    'Riwayat Simpan Wajib'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('KOPKAR'),
      ),
      body: ListView.builder(
        itemCount: _options.length,
        itemBuilder: (context, index) => Material(
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: borderColor)
              ),
              child: Text(_options[index]),
            ),
          ),
        ),
      )
    );
  }
}