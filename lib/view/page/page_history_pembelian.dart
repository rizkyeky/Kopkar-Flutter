part of 'page.dart';

class HistoryPembelianPage extends Page<HistoryPembelianBloc> {

  @override
  void dispose() {
  }

  @override
  void init() {
  }

  final ValueNotifier<bool> cariNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {

    DateTime pickedAwalDate;
    DateTime pickedAkhirDate;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Riwayat Pembelian'),
      ),
      body: ListView(
        children: [
          XBox(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Tanggal Awal'),
                        const SizedBox(height: 6,),                
                        StatefulBuilder(
                          builder: (context, setState) => FlatButton(
                            color: primaryColor,
                            onPressed:() async {
                              pickedAwalDate = await showDatePicker(
                                context: context, 
                                initialDate: DateTime.now(), 
                                firstDate: DateTime(2000), 
                                lastDate: DateTime(2025),
                              );
                              if (pickedAwalDate != null && pickedAwalDate != _bloc.inputAwalDate) {
                                setState(() => _bloc.inputAwalDate = pickedAwalDate);
                              }
                            },
                            child: Text(pickedAwalDate != null ? 
                              _bloc.inputAwalDate.toLocal().toString().split(' ')[0] 
                              : 'Select Date', style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12,),                
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Tanggal Akhir'),
                        const SizedBox(height: 6,),
                        StatefulBuilder(
                          builder: (context, setState) => FlatButton(
                            color: primaryColor,
                            onPressed:() async {
                              pickedAkhirDate = await showDatePicker(
                                context: context, 
                                initialDate: DateTime.now(), 
                                firstDate: DateTime(2000), 
                                lastDate: DateTime(2025),
                              );
                              if (pickedAkhirDate != null && pickedAkhirDate != _bloc.inputAkhirDate) {
                                setState(() => _bloc.inputAkhirDate = pickedAkhirDate);
                              }
                            },
                            child: Text(pickedAkhirDate != null ? 
                              _bloc.inputAkhirDate.toLocal().toString().split(' ')[0] 
                              : 'Select Date', style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                FlatButton.icon(
                  color: primaryColor,
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () => cariNotifier.value = cariNotifier.value != null ? !cariNotifier.value : cariNotifier.value != null,
                  label: const Text('CARI', style: TextStyle(color: Colors.white),)
                )
              ],
            )
          ),
          const Divider(),
          ValueListenableBuilder<bool>(
            valueListenable: cariNotifier,
            builder: (_, value, __) => (value != null) ? FutureBuilder<List<Map>>(
              future: _bloc.getItems(),
              builder: (context, snapshot) => 
                (snapshot.connectionState == ConnectionState.done) ? 
                  (snapshot.data.isNotEmpty) ? Column(
                  children: List.generate(snapshot.data.length, (indexContent) {
                  final Map item = snapshot.data[indexContent];
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
                })
              ) : const Center(child: Text('Data tidak ditemukan'),) 
              : const Center(child: CircularProgressIndicator(),)
            ) : const Center(),
          ),
        ],
      ),
    );
  }
}