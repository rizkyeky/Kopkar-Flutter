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
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: PaintLogin(),
                ),
              ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: XTextField(
                  // controller: _emailText,
                  text: 'Email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: XTextField(
                  obscureText: true,
                  // controller: _passwordText,
                  text: 'Password',
                ),
              ),
              const SizedBox(height: 24,),
              FloatingActionButton.extended(
                elevation: 0,
                highlightElevation: 0,
                onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainPage())), 
                label: Row(
                  children: const [
                    Text('Login', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_forward)
                  ],
                ),
              )
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