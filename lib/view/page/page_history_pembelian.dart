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
      body: FutureBuilder<List<Map>>(
        future: _bloc.getItems(),
        builder: (context, snapshot) => 
          (snapshot.hasData) ? (snapshot.data.isNotEmpty) ? ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            final Map item = snapshot.data[index];
            return XBox(
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(item.length, (indexCol) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.keys.toList()[indexCol] as String,
                        style: appTheme.textTheme.subtitle1),
                      Text(item.values.toList()[indexCol] as String, 
                        style: appTheme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold)),
                    ]
                  ))
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