part of 'page.dart';

enum PinjamanType {berjalan, ajuan}

class PinjamanPage extends Page<PinjamanBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KOPKAR'),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'BERJALAN',),
              Tab(text: 'AJUAN',),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<PinjamanBerjalan>>(
              future: _bloc.getPinjamanBerjalanFromService('07380'),
              builder: (context, snapshot) => (snapshot.hasData) ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => MyCard(PinjamanType.berjalan, item: snapshot.data[index])
                ) : const Center(child: CircularProgressIndicator(),)
            ),
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => const MyCard(PinjamanType.ajuan)
            )
          ]
        )
      ),
    );
  }
}

class MyCard extends StatelessWidget {

  final PinjamanType type;
  final PinjamanBerjalan item;

  const MyCard(this.type, {this.item, Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final str1 = type == PinjamanType.berjalan ? 'Sisa Pinjaman' : 'Dana Pengajuan' ;
    final str2 = type == PinjamanType.berjalan ? 'Total Pinjaman' : 'Ajuan Angsuran' ;
    final str3 = type == PinjamanType.berjalan ? item.sisaPinjaman : 'Rp2.000.000' ;
    final str4 = type == PinjamanType.berjalan ? item.totalPinjaman : '12 bulan' ;
  
    return XBox(
      margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(str1, style: appTheme.textTheme.bodyText1),
                    Text(str3, style: appTheme.textTheme.headline6),
                    const SizedBox(height: 18,),
                    Text(str2, style: appTheme.textTheme.bodyText1),
                    Text(str4, style: appTheme.textTheme.headline6)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(item.docDate, style: appTheme.textTheme.bodyText1),
                    if (type == PinjamanType.ajuan) Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: borderColor)
                      ),
                      child: Text('Berjalan', style: appTheme.textTheme.bodyText2),
                    )
                  ],
                )
              ],
            ),
          ),
          if (type == PinjamanType.berjalan) const Divider(height: 24,),
          if (type == PinjamanType.berjalan) Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jumlah Angsuran', style: appTheme.textTheme.bodyText1),
                  Text(item.jumlahAngsuran, style: appTheme.textTheme.headline6),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Angsuran Berjalan', style: appTheme.textTheme.bodyText1),
                  Text(item.angsuranBerjalan, style: appTheme.textTheme.headline6),
                ],
              )
            ],
          ),
          const Divider(height: 12,),
          FlatButton(onPressed: () {}, child: const Text('LIHAT DETAIL'))
        ],
      ),
    );
  }

}