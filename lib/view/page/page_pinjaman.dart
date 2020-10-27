part of 'page.dart';

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
              itemBuilder: (context, index) => _MyCard1()
            ),
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => _MyCard1()
            )
          ]
        )
      ),
    );
  }
}

class _MyCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.12)),
        borderRadius: BorderRadius.circular(24)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sisa Pinjaman', style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  const Text('Rp2.000.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  const SizedBox(height: 18,),
                  Text('Jumlah Pinjaman', style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  const Text('Rp2.000.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                ],
              ),
              const Text('05/05/2020')
            ],
          ),
          const Divider(height: 24,),
          Row(
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