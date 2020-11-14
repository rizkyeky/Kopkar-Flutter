part of 'page.dart';

class HistoryPPBOPage extends Page<HistoryPPBOBloc> {

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
      body: FutureBuilder<List<Map>>(
      future: _bloc.getPPBOList(),
      builder: (context, snapshot) {
        final List<Map> content = (snapshot.hasData) ? snapshot.data : [{}];
        return (snapshot.hasData) ? ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, index) {
          final Map<String, String> item = Map<String, String>.from(content[index]);
          return XBox(
          child: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(item.length, (index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.keys.toList()[index], 
                    style: appTheme.textTheme.subtitle1),
                  Text(item.values.toList()[index], 
                    style: appTheme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.bold)),
                ]
              ))
            ),
          ),
        );
        },
      ) : const Center(child: CircularProgressIndicator());
      }
    ),
    );
  }

}