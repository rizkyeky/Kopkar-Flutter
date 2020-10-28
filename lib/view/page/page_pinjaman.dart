part of 'page.dart';

enum _PinjamanType {berjalan, ajuan}

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
            // isScrollable: true,
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
              itemBuilder: (context, index) => const  _MyCard(_PinjamanType.berjalan)
            ),
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => const _MyCard(_PinjamanType.ajuan)
            )
          ]
        )
      ),
    );
  }
}

class _MyCard extends StatelessWidget {

  final _PinjamanType type;

  const _MyCard(this.type, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final str1 = type == _PinjamanType.berjalan ? 'Sisa Pinjaman' : 'Dana Pengajuan' ;
    final str2 = type == _PinjamanType.berjalan ? 'Total Pinjaman' : 'Ajuan Angsuran' ;
    final str3 = type == _PinjamanType.berjalan ? 'Rp10.000.000' : 'Rp2.000.000' ;
    final str4 = type == _PinjamanType.berjalan ? 'Rp10.000.000' : '12 bulan' ;
    

    return Container(
      margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.12)),
        borderRadius: BorderRadius.circular(24)
      ),
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
                    Text(str1, style: TextStyle(color: Colors.black.withOpacity(0.6))),
                    Text(str3, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    const SizedBox(height: 18,),
                    Text(str2, style: TextStyle(color: Colors.black.withOpacity(0.6))),
                    Text(str4, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('05/05/2020'),
                    if (type == _PinjamanType.ajuan) Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: borderColor)
                      ),
                      child: Text('Berjalan', style: TextStyle(color: Colors.black.withOpacity(0.6)),),
                    )
                  ],
                )
              ],
            ),
          ),
          if (type == _PinjamanType.berjalan) const Divider(height: 24,),
          if (type == _PinjamanType.berjalan) Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jumlah Angsuran', style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  const Text('12 bulan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Angsuran Berjalan', style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  const Text('12 bulan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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