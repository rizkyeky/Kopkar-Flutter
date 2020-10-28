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
        body: TabBarView(
          children: [
            const Center(child: Text('Sukarela'),),
            const Center(child: Text('Wajib'),)
          ]
        )
      ),
    );
  }
}