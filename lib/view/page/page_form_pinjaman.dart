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

  final ValueNotifier<bool> _validNotifier = ValueNotifier(false);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Form Pinjaman'),
      ),
      body:SingleChildScrollView(
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
            FutureBuilder<List<Map>>(
              future: _bloc.getJenisPinjaman(),
              builder: (context, snapshot) {
                final List<Map> content = snapshot.data ?? [];
                return Row(
                  children: [
                    XDropDown(
                      length: content.length,
                      onSelected: (val) => 
                        _bloc.inputJenisPinjaman = Map<String, String>.from(content[val]),
                      childrenBuilder: (context, index) => 
                        Text(content[index]['jenis_pinjaman_name'] as String),
                    ),
                    const SizedBox(width: 12,),
                    SizedBox(
                      height: 16,
                      width: 16, 
                      child: (snapshot.connectionState == ConnectionState.waiting) 
                        ? const CircularProgressIndicator() : null,
                    )
                  ],
                );
              }
            ),
            TexFieldSimpanan(
              keyboardType: TextInputType.number,
              title: 'Nominal Pinjaman',
              hitText: 'Contoh: 30000000',
              onChanged: (val) {
                if (!_validNotifier.value && 
                  _bloc.inputLamaPinjaman != null && 
                  _bloc.inputTotalPinjaman != null &&
                  _bloc.inputLamaPinjaman != '' &&
                  _bloc.inputTotalPinjaman != ''
                ) {
                  _validNotifier.value = true;
                } else {
                  _validNotifier.value = false;
                }
                _bloc.inputTotalPinjaman = val;
              },
            ),
            TexFieldSimpanan(
              keyboardType: TextInputType.number,
              title: 'Lama Angsuran (Bulan)',
              hitText: 'Contoh: 12',
              onChanged: (val) {
                if (!_validNotifier.value && 
                  _bloc.inputLamaPinjaman != null && 
                  _bloc.inputTotalPinjaman != null &&
                  _bloc.inputLamaPinjaman != '' &&
                  _bloc.inputTotalPinjaman != ''
                ) {
                  _validNotifier.value = true;
                } else {
                  _validNotifier.value = false;
                }
                _bloc.inputLamaPinjaman = val;
              },
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
                  Text(_bloc.inputFotoKTP != null ? 'Tersimpan' : 'Tidak ada',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
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
                  Text(_bloc.inputFotoSlipGaji != null ? 'Tersimpan' : 'Tidak ada',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
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
                  Text(_bloc.inputFotoNPWP != null ? 'Tersimpan' : 'Tidak ada',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            TexFieldSimpanan(
              title: 'Keperluan',
              hitText: 'Contoh: Untuk Beli Motor',
              onChanged: (val) => _bloc.keperluan = val,
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder<bool>(
              valueListenable: _validNotifier,
              builder: (context, value, child) => FlatButton(
                color: primaryColor,
                disabledColor: Colors.black.withOpacity(0.12),
                disabledTextColor: Colors.black.withOpacity(0.12),
                onPressed: value ? () => Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => SimulationPage(
                    total: int.parse(_bloc.inputTotalPinjaman),
                    lama: int.parse(_bloc.inputLamaPinjaman),
                  ))
                ) : null,
                child: const Text('Simulasi', style: TextStyle(color: Colors.white)),
              )
            ),
            const SizedBox(height: 78),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _bloc.awaitNotifier,
        builder: (context, value, child) {
          return FloatingActionButton.extended(
            elevation: 0,
            highlightElevation: 0,
            onPressed: () async {
              final bool isSuccess = await _bloc.setPinjaman();
              if (isSuccess) {
                Navigator.pop(context);
              }
            }, 
            label: value ? const Center(
              child:  CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ) : const Text('Simpan')
          );
        },
      ),
    );
  }
}