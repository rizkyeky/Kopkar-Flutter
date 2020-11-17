part of 'page.dart';

class HistoryPembelianDetailPage extends Page<HistoryPembelianBloc> {

  final String docNo;

  HistoryPembelianDetailPage(this.docNo);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail Pembelian'),
      ),
      body: FutureBuilder<List<Map>>(
        future: _bloc.getTable(docNo),
        builder: (context, snapshot) => 
          (snapshot.hasData) ? (snapshot.data.isNotEmpty) ? Builder(
            builder: (context) {
              final List<Map> data = snapshot.data;
              final List column = data[0].keys.toList();
              return SingleChildScrollView(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: List.generate(column.length, (indexCol) => 
                    DataColumn(label: Text(column[indexCol] as String ?? 'null'))),
                  rows: List.generate(data.length, (indexRow) {
                    final List item = data[indexRow].values.toList();
                    return DataRow(
                      cells: List.generate(column.length, (indexCell) => 
                        DataCell(Text(item[indexCell] as String ?? 'null'))
                      )
                    );
                  })
                ),
              ),
            );
            },
          ) : const Center(child: Text('Data tidak ditemukan'),) 
          : const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}