part of 'page.dart';

class LoginPage extends Page<LoginBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (contextScaffold) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: PaintLogin(),
                ),
              ), 
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: XTextField(
                  text: 'NIK',
                  onChanged: (val) => _bloc.inputNIK = val,
                  keyboardType: TextInputType.number,
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(24),
                child: XTextField(
                  obscureText: true,
                  text: 'Password',
                  onChanged: (val) => _bloc.inputPassword = val,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 24,),
              FloatingActionButton.extended(
                elevation: 0,
                highlightElevation: 0,
                onPressed: () async {
                  
                  final bool isValid = (_bloc.inputNIK != null && _bloc.inputNIK != '') 
                    && (_bloc.inputPassword != null && _bloc.inputPassword != '');
                  
                  if (isValid) {
                    final bool isSuccess = await _bloc.getLogin();
                    if (isSuccess) {
                      Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => MainPage()));
                    } else {
                      Scaffold.of(contextScaffold).showSnackBar(snackBar(
                        contentText: 'Login gagal',
                        labelText: 'TUTUP',
                        onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                      ));
                    }
                  } else {
                    Scaffold.of(contextScaffold).showSnackBar(snackBar(
                      contentText: 'NIK dan Password belum terisi',
                      labelText: 'TUTUP',
                      onPressed: () => Scaffold.of(contextScaffold).hideCurrentSnackBar()
                    ));
                  }
                }, 
                label: Row(
                  children: const [
                    Text('Login', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              ),
              const SizedBox(height: 42,),
              ValueListenableBuilder<bool>(
                valueListenable: _bloc.awaitLogin,
                builder: (context, value, child) {
                  return Center(child: value ? child : null);
                },
                child: const CircularProgressIndicator()
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaintLogin extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
      final double path1xs = size.width / 375;
      final double path1ys = size.height / 300;

      final Path path1 = Path()
          ..moveTo(376.33 * path1xs, 254.61 * path1ys)
          ..cubicTo(376.33 * path1xs, 254.61 * path1ys,338.69 * path1xs, 300.94 * path1ys,266.05 * path1xs, 299.99 * path1ys)
          ..cubicTo(193.41 * path1xs, 299.03 * path1ys,170.5 * path1xs, 257.22 * path1ys,100.65 * path1xs, 254.61 * path1ys)
          ..cubicTo(30.79 * path1xs, 251.99 * path1ys,0 * path1xs, 299.99 * path1ys,0 * path1xs, 299.99 * path1ys)
          ..lineTo(0 * path1xs, 0 * path1ys)
          ..lineTo(376.33 * path1xs, 0 * path1ys)
          ..lineTo(376.33 * path1xs, 254.61 * path1ys)
          ..close();

      final Paint path1fillPaint = Paint()..style = PaintingStyle.fill..color = const Color(0xff2196f3);

      final Paint path1strokePaint = Paint()
          ..style = PaintingStyle.stroke
          ..color = const Color(0x4d2196f3)
          ..strokeWidth = 6;

        canvas.drawPath(path1, path1fillPaint);
        canvas.drawPath(path1, path1strokePaint);
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  

}