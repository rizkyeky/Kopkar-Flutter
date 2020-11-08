part of 'page.dart';

class DetailPinjamanPage extends Page<DetailPinjamanBloc> {

  final String docNo;

  DetailPinjamanPage(this.docNo);

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
        title: const Text('Detail'),
      ),
      body: FutureBuilder<List<Map>>(
        future: _bloc.getTable(docNo),
        builder: (context, snapshot) {
          final List<Map> data = snapshot.data ?? [];
          final List column = (data.isNotEmpty) ? data[0].keys.toList() : [];
          return (snapshot.hasData) ? (column.isNotEmpty) ? SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: List.generate(column.length, (indexCol) => 
                  DataColumn(label: Text(column[indexCol] as String))),
                rows: List.generate(data.length, (indexRow) {
                  final List item = data[indexRow].values.toList();
                  return DataRow(
                    cells: List.generate(column.length, (indexCell) => 
                      DataCell(Text(item[indexCell] as String))
                    )
                  );
                })
              ),
            ),
          ) : const Center(child: Text('Data tidak ditemukan'),) 
          : const Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}