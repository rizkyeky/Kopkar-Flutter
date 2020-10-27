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
          children: List.generate(2, (index) => 
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => _MyCard()
            )
          )
        )
      ),
    );
  }
}

class _MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.12)),
        borderRadius: BorderRadius.circular(24)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Sisa Pinjaman', ),
                  Text('Rp2.000.000', style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 24,),
                  Text('Jumlah Pinjaman', ),
                  Text('Rp2.000.000', style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
          const Divider(),
          FlatButton(onPressed: () {}, child: Text('LIHAT DETAIL'))
        ],
      ),
    );
  }

}