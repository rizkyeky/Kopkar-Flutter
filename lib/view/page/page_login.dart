part of 'page.dart';

class LoginPage extends Page<LoginBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (contextScaffold) => Stack(
          children: [
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: const CustomPaint(
                painter: LoginBackgroundPainter(),
              )
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 300,),
                  XTextField(
                    controller: _emailText,
                    text: 'Email',
                  ),
                  const SizedBox(height: 24,),
                  XTextField(
                    obscureText: true,
                    controller: _passwordText,
                    text: 'Password',
                  ),
                  const SizedBox(height: 24,),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginBackgroundPainter extends CustomPainter {
  
  const LoginBackgroundPainter();
  
  @override
  void paint(Canvas canvas, Size size) {

    var path = Path();
    var paint = Paint();

    var w = size.width;
    var h = size.height;

    // var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // path.addRect(rect);

    path.moveTo(0, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h);

    path.arcToPoint(Offset(w/2, h/2));

    path.lineTo(0, h);
    path.close();

    var colors = [Colors.blue, Colors.white];
    var stops = [0 / 2, 1.8 / 2];

    Rect rectShape = new Rect.fromLTWH(0, 0, size.width, size.height);
    final Gradient gradient = LinearGradient(
      colors: colors, 
      stops: stops,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
      );

    paint = new Paint()..shader = gradient.createShader(rectShape);

    canvas.drawPath(path, paint);
  }

  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}