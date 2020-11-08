part of 'page.dart';

class FormSimpananPage extends Page<SimpananBloc> {

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
        title: const Text('Form Simpanan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TexFieldSimpanan(
              title: 'NIK',
              hitText: 'Contoh: 7000',
              onSubmitted: (val) => _bloc.nikAnggota = val
            ),
            TexFieldSimpanan(
              title: 'Gaji Pokok',
              hitText: 'Contoh: 10000000',
              onSubmitted: (val) => _bloc.gajiPokok = val,
            ),
            TexFieldSimpanan(
              title: 'Nominal Pinjaman',
              hitText: 'Contoh: 30000000',
              onSubmitted: (val) => _bloc.nominalPinjaman = val,
            ),
            TexFieldSimpanan(
              title: 'Keperluan',
              hitText: 'Contoh: Untuk Beli Motor',
              onSubmitted: (val) => _bloc.keperluan = val,
            ),
          ],
        ),
      ),
    );
  }
}

class TexFieldSimpanan extends StatelessWidget {
  
  final String title;
  final String hitText;
  final void Function(String) onSubmitted;
  final TextInputType keyboardType;

  const TexFieldSimpanan({
    Key key,
    this.title,
    this.hitText,
    this.onSubmitted,
    this.keyboardType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,18,0,6),
          child: Text(title, 
            textAlign: TextAlign.left,
            style: appTheme.textTheme.headline5.copyWith(fontSize: 18),
          ),
        ),
        XTextField(
          text: hitText,
          onSubmitted: onSubmitted,
          keyboardType: keyboardType,
        )
      ],
    );
  }
}