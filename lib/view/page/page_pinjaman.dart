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
            tabs: [
              Tab(text: 'BERJALAN',),
              Tab(text: 'AJUAN',),
            ]
          ),
        ),
        body: Builder(
          builder: (scaffContext) => TabBarView(
            children: [
              FutureBuilder<List<PinjamanBerjalan>>(
                future: _bloc.getPinjamanBerjalanFromService('07380'),
                builder: (context, snapshot) => (snapshot.hasData) ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => PinjamanCard(snapshot.data[index])
                ) : const Center(child: CircularProgressIndicator(),)
              ),
              FutureBuilder<List<PinjamanAjuan>>(
                future: _bloc.getPinjamanAjuanFromService('07380'),
                builder: (context, snapshot) => (snapshot.hasData) ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => PinjamanCard(snapshot.data[index])
                ) : const Center(child: CircularProgressIndicator(),)
              ),
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          highlightElevation: 0,
          onPressed: () => Navigator.push(context, 
            MaterialPageRoute(builder: (context) => FormPinjamanPage())),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class PinjamanCard extends StatelessWidget {

  final PinjamanItem item;

  const PinjamanCard(this.item, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String key1 = item is PinjamanBerjalan ? 'Sisa Pinjaman' : 'Dana Pengajuan' ;
    final String key2 = item is PinjamanBerjalan ? 'Total Pinjaman' : 'Ajuan Angsuran' ;
    String val1;
    String val2;
  
    if (item is PinjamanBerjalan) {
      val1 = (item as PinjamanBerjalan).sisaPinjaman;
      val2 = (item as PinjamanBerjalan).totalPinjaman;
    } else {
      val1 = (item as PinjamanAjuan).danaPengajuan;
      val2 = (item as PinjamanAjuan).ajuanAngsuran;
    }
    
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
                    Text(key1, style: appTheme.textTheme.bodyText1),
                    Text(val1, style: appTheme.textTheme.headline6),
                    const SizedBox(height: 18,),
                    Text(key2, style: appTheme.textTheme.bodyText1),
                    Text(val2, style: appTheme.textTheme.headline6)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(item.docDate, style: appTheme.textTheme.bodyText1),
                    if (item is PinjamanAjuan) Builder(
                      builder: (context) {
                        Color color;
                        switch ((item as PinjamanAjuan).status) {
                          case 'OPEN':
                            color = Colors.green.withOpacity(0.6);
                            break;
                          case 'PENDING':
                            color = Colors.yellow.withOpacity(0.6);
                            break;
                          case 'CLOSE':
                            color = Colors.red.withOpacity(0.6);
                            break;
                          default:
                            color = Colors.white;
                        }
                        return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: borderColor)
                        ),
                        child: Text((item as PinjamanAjuan).status, style: appTheme.textTheme.bodyText2),
                      );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          if (item is PinjamanBerjalan) const Divider(height: 24,),
          if (item is PinjamanBerjalan) Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jumlah Angsuran', style: appTheme.textTheme.bodyText1),
                  Text((item as PinjamanBerjalan).jumlahAngsuran, style: appTheme.textTheme.headline6),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Angsuran Berjalan', style: appTheme.textTheme.bodyText1),
                  Text((item as PinjamanBerjalan).angsuranBerjalan, style: appTheme.textTheme.headline6),
                ],
              )
            ],
          ),
          const Divider(height: 12,),
          FlatButton(
            onPressed: () =>Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => DetailPinjamanPage(item.docNo)
              )
            ), 
            child: const Text('LIHAT DETAIL')
          )
        ],
      ),
    );
  }

}