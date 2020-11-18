part of 'page.dart';

class SimulationPage extends Page<SimulationBloc> {
  
  final int total;
  final int lama;

  SimulationPage({this.total, this.lama});

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
        title: const Text('Simulasi'),
      ),
      body: FutureBuilder<Map>(
        future: _bloc.getMap(total, lama),
        builder: (context, snapshot) => 
          (snapshot.hasData) ? (snapshot.data.isNotEmpty) ? Builder(
            builder: (context) {
              final List<Map> data = List<Map>.from(snapshot.data['result'] as List);
              final List column = data[0].keys.toList();
              final Map content = Map.from(snapshot.data);
              if (content.containsKey('result')) content.remove('result');
              return SingleChildScrollView(
                child: Column(
                  children: [
                    XBox(
                      margin: const EdgeInsets.all(24),
                      padding: const EdgeInsets.all(24),
                      child: SizedBox(
                        height: 240,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(content.length, (indexCol) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(content.keys.toList()[indexCol].toString() ?? 'null',
                                style: appTheme.textTheme.subtitle1),
                              Text(content.values.toList()[indexCol].toString() ?? 'null', 
                                style: appTheme.textTheme.subtitle2
                                .copyWith(fontWeight: FontWeight.bold)),
                            ]
                          ))
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: List.generate(column.length, (indexCol) => 
                            DataColumn(label: Text(column[indexCol].toString() ?? 'null'))),
                          rows: List.generate(data.length, (indexRow) {
                            final List item = data[indexRow].values.toList();
                            return DataRow(
                              cells: List.generate(column.length, (indexCell) => 
                                DataCell(Text(item[indexCell].toString() ?? 'null'))
                              )
                            );
                          })
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ) : const Center(child: Text('Data tidak ditemukan'),) 
          : const Center(child: CircularProgressIndicator(),))
    );
  }
}