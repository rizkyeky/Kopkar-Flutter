part of 'page.dart';

class HistoryPotonganPage extends Page<HistoryPotoganBloc> {

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final ValueNotifier<bool> cariNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Potongan'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          XBox(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tanggal Awal'),
                const SizedBox(height: 6,),
                XTextField(
                  onChanged: (val) {},
                  hintText: 'Contoh: 2020-12-31',
                ),
                const SizedBox(height: 12,),
                const Text('Tanggal Akhir'),
                const SizedBox(height: 6,),
                XTextField(
                  onChanged: (val) {},
                  hintText: 'Contoh: 2021-12-31',
                ),
                const SizedBox(height: 12,),
                FlatButton(
                  color: primaryColor,
                  onPressed: () => cariNotifier.value = cariNotifier.value != null ? !cariNotifier.value : cariNotifier.value != null,
                  child: const Text('CARI', style: TextStyle(color: Colors.white),)
                )
              ],
            )
          ),
          const Divider(),
          ValueListenableBuilder<bool>(
          valueListenable: cariNotifier,
          builder: (context, value, child) => (value != null) ? FutureBuilder<List<Map>>(
            future: _bloc.getList(),
            builder: (context, snapshot) => 
              snapshot.connectionState == ConnectionState.done 
              ? snapshot.data.isNotEmpty ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(snapshot.data.length, (indexContent) {
                final List<Map> content = snapshot.data;
                return XBox(
                child: SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(content[indexContent].length, (indexItem) {
                      final Map<String, String> item = Map<String, String>.from(content[indexContent]);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.keys.toList()[indexItem] ?? 'null', 
                            style: appTheme.textTheme.subtitle1),
                          Text(item.values.toList()[indexItem] ?? 'null', 
                            style: appTheme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold)),
                        ]
                      );
                    })
                  ),
                ),
              );
              })
            ) : const SizedBox(
                height: 300,
                child: Center(child: Text('Data tidak ditemukan'),))
              : const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator(),)
            )
          ) : const Center(),
        )
        ],
      ),
    );
  }
}