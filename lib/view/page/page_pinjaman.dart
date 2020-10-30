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
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => const  MyCard(PinjamanType.berjalan)
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

  const MyCard(this.type, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final str1 = type == PinjamanType.berjalan ? 'Sisa Pinjaman' : 'Dana Pengajuan' ;
    final str2 = type == PinjamanType.berjalan ? 'Total Pinjaman' : 'Ajuan Angsuran' ;
    final str3 = type == PinjamanType.berjalan ? 'Rp10.000.000' : 'Rp2.000.000' ;
    final str4 = type == PinjamanType.berjalan ? 'Rp10.000.000' : '12 bulan' ;
  
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
                    Text(str3, style: appTheme.textTheme.headline6,),
                    const SizedBox(height: 18,),
                    Text(str2, style: appTheme.textTheme.bodyText1),
                    Text(str4, style: appTheme.textTheme.headline6)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('05/05/2020', style: appTheme.textTheme.bodyText1),
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
                  Text('12 bulan', style: appTheme.textTheme.headline6),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Angsuran Berjalan', style: appTheme.textTheme.bodyText1),
                  Text('12 bulan', style: appTheme.textTheme.headline6),
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