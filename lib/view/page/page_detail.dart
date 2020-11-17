part of 'page.dart';

class DetailPage extends StatelessWidget {

  final String docNo;
  final String name;
  final Future<List<Map>> Function(String) future;

  const DetailPage(this.docNo, this.future, {this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(name),
      ),
      body: FutureBuilder<List<Map>>(
        future: future(docNo),
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
          : const Center(child: CircularProgressIndicator(),))
    );
  }
}