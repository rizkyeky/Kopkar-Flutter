part of 'page.dart';

class SimpananPage extends Page<SimpananBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KOPKAR'),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            // isScrollable: true,
            tabs: [
              Tab(text: 'SUKARELA',),
              Tab(text: 'WAJIB',),
            ]
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Sukarela'),),
            Center(child: Text('Wajib'),)
          ]
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          highlightElevation: 0,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormSimpananPage())),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}