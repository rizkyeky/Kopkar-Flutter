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
      body: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => XBox(
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(1, (index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('', 
                  style: appTheme.textTheme.subtitle1),
                Text('', 
                  style: appTheme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold)),
              ]
            ))
          ),
        ),
      ),),
    );
  }
}