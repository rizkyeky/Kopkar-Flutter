part of 'page.dart';

class HistorySimpananWPage extends Page<HistorySimpananBloc> {

  @override
  void dispose() {
  }

  @override
  void init() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {},
                child: const Text('CARI', style: TextStyle(color: Colors.white),)
              )
            ],
          )
        ),
        const Divider(),
        
        ValueListenableBuilder<bool>(
          valueListenable: null,
          builder: (context, value, child) => (value != null) ? FutureBuilder<List<Map>>(
            future: null,
            builder: (context, snapshot) => (snapshot.hasData) ? (snapshot.data.isNotEmpty) ? Column(
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
                          Text(item.keys.toList()[indexItem] ?? '', 
                            style: appTheme.textTheme.subtitle1),
                          Text(item.values.toList()[indexItem] ?? '', 
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
                child: Center(child: Text('Tidak Ada Data'),))
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