part of 'page.dart';

class HistoryPage extends Page<HistoryBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  final Map<String, HistoryType> _options = {
    'Riwayat Pembelian Toko': HistoryType.pembelian,
    'Riwayat PPBO': HistoryType.ppbo,
    'Riwayat Pinjaman': HistoryType.pinjaman,
    'Riwayat Potongan Bulanan': HistoryType.potongan,
    'Riwayat SHU': HistoryType.shu,
    'Riwayat Simpan Wajib': HistoryType.simpanan
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('KOPKAR'),
      ),
      body: ListView.builder(
        itemCount: _options.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Material(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: borderColor)
            ),
            child: InkWell(
              onTap: () => Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => 
                    HistoryOptionPage(_options.values.toList()[index]))
                ),
              child: SizedBox(
                height: 54,
                child: Center(child: Text(_options.keys.toList()[index]))
              )
            )
          ),
        ),
      )
    );
  }
}