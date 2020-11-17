part of 'page.dart';

class HistoryPembelianPage extends Page<HistoryPembelianBloc> {

  @override
  void dispose() {
  }

  @override
  void init() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Riwayat Pembelian'),
      ),
      body: FutureBuilder<List<Map>>(
        future: _bloc.getItems(),
        builder: (context, snapshot) => 
          (snapshot.hasData) ? (snapshot.data.isNotEmpty) ? ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 12),  
          padding: const EdgeInsets.all(24),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            final Map item = snapshot.data[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(12)
              ),
              child: InkWell(
                onTap: () => Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => 
                    DetailPage(item['doc_no'] as String, _bloc.getTable, name: 'Detail Pembelian'))),
                child: SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(item.length, (indexCol) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.keys.toList()[indexCol] as String,
                            style: appTheme.textTheme.subtitle1),
                          Text(item.values.toList()[indexCol] as String, 
                            style: appTheme.textTheme.subtitle2
                            .copyWith(fontWeight: FontWeight.bold)),
                        ]
                      ))
                    ),
                  ),
                ),
              ),
            );
          },) : const Center(child: Text('Data tidak ditemukan'),) 
          : const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}