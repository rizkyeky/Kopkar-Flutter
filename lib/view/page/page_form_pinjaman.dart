part of 'page.dart';

class FormPinjamanPage extends Page<PinjamanBloc> {

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
        title: const Text('Form Pinjaman'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.fromLTRB(0,18,0,6),
              child: Text('Jenis', 
                textAlign: TextAlign.left,
                style: appTheme.textTheme.headline5.copyWith(fontSize: 18),
              ),
            ),
            XDropDown(
              length: 3,
              onSelected: (val) => _bloc.jenis = val.toString(),
              childrenBuilder: (context, index) => Text('Nomor ${index+1}'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,18,0,6),
              child: Text('Jenis Pinjaman', 
                textAlign: TextAlign.left,
                style: appTheme.textTheme.headline5.copyWith(fontSize: 18),
              ),
            ),
            XDropDown(
              length: 3,
              onSelected: (val) => _bloc.jenisPinjaman = val.toString(),
              childrenBuilder: (context, index) => Text('Nomor ${index+1}'),
            ),
            TexFieldSimpanan(
              title: 'Nominal Pinjaman',
              hitText: 'Contoh: 30000000',
              onSubmitted: (val) => _bloc.nominalPinjaman = val,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,18,0,6),
              child: Text('Tenor', 
                textAlign: TextAlign.left,
                style: appTheme.textTheme.headline5.copyWith(fontSize: 18),
              ),
            ),
            XDropDown(
              length: 3,
              onSelected: (val) => _bloc.jenisPinjaman = val.toString(),
              childrenBuilder: (context, index) => Text('Nomor ${index+1}'),
            ),
            TexFieldSimpanan(
              title: 'Keperluan',
              hitText: 'Contoh: Untuk Beli Motor',
              onSubmitted: (val) => _bloc.keperluan = val,
            ),
            const SizedBox(height: 78),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        highlightElevation: 0,
        onPressed: () {}, 
        label: const Text('Simpan')
      ),
    );
  }
}