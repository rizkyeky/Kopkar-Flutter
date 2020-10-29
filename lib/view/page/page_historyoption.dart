part of 'page.dart';


class HistoryOptionPage extends Page<HistoryOptionBloc> {

  final HistoryType type;

  HistoryOptionPage(this.type);

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {

    Widget body;
    String name;

    switch (type) {
      case HistoryType.pembelian:
        body = HistoryPembelianBody();
        name = 'Riwayat Pembelian';
        break;
      case HistoryType.simpanan:
        body = HistorySimpananBody();
        name = 'Riwayat Simpanan';
        break;
      case HistoryType.shu:
        body = HistorySimpananBody();
        name = 'Riwayat SHU';
        break;
      default:
        body = const Center(child: Text('Default'));
        name = 'Default';
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(name),
        centerTitle: true,
      ),
      body: body
    );
  }
}

class HistoryPembelianBody extends StatelessWidget {

  final Map<String, String> content = {
    'Doc No': 'PIN2020020001',
    'Doc Date': '10 Januari 2020',
    'Status Bayar': 'BELUM LUNAS',
    'Awal Pembelian': '10 Maret 2020',
    'Gaji Pokok': 'Rp10.000.000',
    'Plan Pinjaman': 'Rp10.000.000'
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => XBox(
        child: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(content.length, (index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(content.keys.toList()[index]),
                Text(content.values.toList()[index], 
                  style: const TextStyle(fontWeight: FontWeight.bold),),
              ]
            ))
          ),
        ),
      ), 
    );
  }
}

class HistorySimpananBody extends StatelessWidget {

  final TextEditingController _tglAwalcontroller = TextEditingController();
  final TextEditingController _tglAkhircontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        XBox(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tanggal Awal'),
              const SizedBox(height: 12,),
              XTextField(
                controller: _tglAwalcontroller,
              ),
              const SizedBox(height: 24,),
              const Text('Tanggal Akhir'),
              const SizedBox(height: 12,),
              XTextField(
                controller: _tglAkhircontroller,
              ),
              const SizedBox(height: 12,),
              const Divider(),
              FlatButton(onPressed: () {}, child: const Text('CARI'))
            ],
          )
        )
      ],
    );
  }
}