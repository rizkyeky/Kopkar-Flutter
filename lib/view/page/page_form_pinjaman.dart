part of 'page.dart';

class FormPinjamanPage extends Page<PinjamanBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  Future<File> getImage() async {
    final picker = ImagePicker();
    try {
      final PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
      return File(pickedFile.path);
    } catch (e) {
      return null;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Form Pinjaman'),
      ),
      body: FutureBuilder<void>(
        future: _bloc.getJenisPinjaman(),
        builder: (context, snapshot) => 
          (snapshot.connectionState == ConnectionState.done) ? SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,18,0,6),
                  child: Text('Jenis Pinjaman', 
                    textAlign: TextAlign.left,
                    style: appTheme.textTheme.headline5.copyWith(fontSize: 16),
                  ),
                ),
                XDropDown(
                  length: _bloc.jenisPinjaman.length,
                  onSelected: (val) => 
                    _bloc.inputJenisPinjaman = Map<String, String>.from(_bloc.jenisPinjaman[val]),
                  childrenBuilder: (context, index) => 
                    Text(_bloc.jenisPinjaman[index]['jenis_pinjaman_name'] as String),
                ),
                TexFieldSimpanan(
                  keyboardType: TextInputType.number,
                  title: 'Nominal Pinjaman',
                  hitText: 'Contoh: 30000000',
                  onSubmitted: (val) => _bloc.nominalPinjaman = val,
                ),
                TexFieldSimpanan(
                  title: 'Lama Angsuran (Bulan)',
                  hitText: 'Contoh: 12',
                  onSubmitted: (val) => _bloc.keperluan = val,
                ),
                const SizedBox(height: 18),
                StatefulBuilder(
                  builder: (context, setState) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        color: primaryColor,
                        onPressed: () async {
                          final picked = await getImage();
                          if (picked != null && picked != _bloc.inputFotoKTP) {
                            setState(() => _bloc.inputFotoKTP = picked);
                          }
                        },
                        child: const Text('Upload Foto KTP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(_bloc.inputFotoKTP != null ? _bloc.inputFotoKTP.path : 'Tidak ada',
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ),
                StatefulBuilder(
                  builder: (context, setState) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        color: primaryColor,
                        onPressed: () async {
                          final picked = await getImage();
                          if (picked != null && picked != _bloc.inputFotoSlipGaji) {
                            setState(() => _bloc.inputFotoSlipGaji = picked);
                          }
                        },
                        child: const Text('Upload Foto Slip Gaji',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(_bloc.inputFotoSlipGaji != null ? _bloc.inputFotoSlipGaji.path : 'Tidak ada',
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ),
                StatefulBuilder(
                  builder: (context, setState) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        color: primaryColor,
                        onPressed: () async {
                          final picked = await getImage();
                          if (picked != null && picked != _bloc.inputFotoNPWP) {
                            setState(() => _bloc.inputFotoNPWP = picked);
                          }
                        },
                        child: const Text('Upload Foto NPWP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(_bloc.inputFotoNPWP != null ? _bloc.inputFotoNPWP.path : 'Tidak ada',
                        textAlign: TextAlign.right,
                      )
                    ],
                  ),
                ),
                TexFieldSimpanan(
                  title: 'Keperluan',
                  hitText: 'Contoh: Untuk Beli Motor',
                  onSubmitted: (val) => _bloc.keperluan = val,
                ),
                const SizedBox(height: 78),
              ],
            ),  
          ) : const Center(child: CircularProgressIndicator()),
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