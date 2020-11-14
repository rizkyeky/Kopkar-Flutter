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
        body = HistorySimpananBody(
          onSubmittedDateAwal: (val) => _bloc.dateAwal = val,
          onSubmittedDateAkhir: (val) => _bloc.dateAkhir = val,
          onPressedCari: _bloc.getSimpananList,
          getList: _bloc.getSimpananList,
        );
        name = 'Riwayat Simpanan';
        break;
      // case HistoryType.shu:
      //   body = HistorySimpananBody();
      //   name = 'Riwayat SHU';
      //   break;
      case HistoryType.ppbo:
        body = HistoryPPBO(
          getList: _bloc.getPPBOList
        );
        name = 'PPBO';
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

class HistoryPPBO extends StatelessWidget {

  final Future<List<Map>> Function() getList;

  const HistoryPPBO({Key key, this.getList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map>>(
      future: getList(),
      builder: (context, snapshot) {
        final List<Map> content = (snapshot.hasData) ? snapshot.data : [{}];
        return (snapshot.hasData) ? ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, index) {
          final Map<String, String> item = Map<String, String>.from(content[index]);
          return XBox(
          child: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(item.length, (index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.keys.toList()[index], 
                    style: appTheme.textTheme.subtitle1),
                  Text(item.values.toList()[index], 
                    style: appTheme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold)),
                ]
              ))
            ),
          ),
        );
        },
      ) : const Center(child: CircularProgressIndicator());
      }
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
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(content.length, (index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(content.keys.toList()[index], 
                  style: appTheme.textTheme.subtitle1),
                Text(content.values.toList()[index], 
                  style: appTheme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold)),
              ]
            ))
          ),
        ),
      ), 
    );
  }
}

class HistorySimpananBody extends StatelessWidget {
  
  final Future<List<Map>> Function() getList;
  final void Function(String) onSubmittedDateAwal;
  final void Function(String) onSubmittedDateAkhir;
  final void Function() onPressedCari;
  final ValueNotifier<bool> notifierCari = ValueNotifier(null);

  HistorySimpananBody({
    Key key, 
    this.getList,
    this.onSubmittedDateAwal,
    this.onSubmittedDateAkhir,
    this.onPressedCari,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        XBox(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tanggal Awal'),
              const SizedBox(height: 6,),
              XTextField(
                onChanged: onSubmittedDateAwal,
                hintText: 'Contoh: 2020-12-31',
              ),
              const SizedBox(height: 12,),
              const Text('Tanggal Akhir'),
              const SizedBox(height: 6,),
              XTextField(
                onChanged: onSubmittedDateAkhir,
                hintText: 'Contoh: 2021-12-31',
              ),
              const SizedBox(height: 12,),
              FlatButton(
                color: primaryColor,
                onPressed: () => notifierCari.value != null ? 
                  notifierCari.value = !notifierCari.value 
                  : notifierCari.value = false,
                child: const Text('CARI', style: TextStyle(color: Colors.white),)
              )
            ],
          )
        ),
        const Divider(),
        
        ValueListenableBuilder<bool>(
          valueListenable: notifierCari,
          builder: (context, value, child) => (value != null) ? FutureBuilder<List<Map>>(
            future: getList(),
            builder: (context, snapshot) => (snapshot.hasData) ? (snapshot.data.isNotEmpty) ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(snapshot.data.length, (indexContent) {
                final List<Map> content = snapshot.data;
                return XBox(
                child: SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(content[indexContent].length, (indexItem) {
                      final Map<String, String> item = Map<String, String>.from(content[indexContent]);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.keys.toList()[indexItem] ?? '', 
                            style: appTheme.textTheme.subtitle1),
                          Text(item.values.toList()[indexItem] ?? '', 
                            style: appTheme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold)),
                        ]
                      );
                    })
                  ),
                ),
              );
              })
            ) : const SizedBox(
                height: 300,
                child: Center(child: Text('Tidak Ada Data'),))
              : const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator(),)
            )
          ) : const Center(),
        )

      ],
    );
  }
}