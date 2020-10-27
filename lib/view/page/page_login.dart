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
        builder: (contextScaffold) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/bglogin.svg',
                fit: BoxFit.cover,
                height: 300,
              ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.all(24),
                child: XTextField(
                  controller: _emailText,
                  text: 'Email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: XTextField(
                  obscureText: true,
                  controller: _passwordText,
                  text: 'Password',
                ),
              ),
              const SizedBox(height: 24,),
              FloatingActionButton.extended(
                elevation: 0,
                highlightElevation: 0,
                onPressed: () {}, 
                label: Row(
                  children: const [
                    Text('Login', style: TextStyle(fontSize: 24)),
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

class LoginBackgroundPainter extends CustomPainter {
  
  const LoginBackgroundPainter();
  
  @override
  void paint(Canvas canvas, Size size) {

    final path = Path();
    var paint = Paint();

    path.moveTo(0, 0);
    path.moveTo(size.width, 0);
    path.moveTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    // path.lineTo(0, size.height);
    path.lineTo(0, size.height);

    final colors = [Colors.blue, Colors.white];
    final stops = [0 / 2, 1.8 / 2];

    final Rect rectShape = Rect.fromLTWH(0, 0, size.width, size.height);
    final Gradient gradient = LinearGradient(
      colors: colors, 
      stops: stops,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
    );

    paint = Paint()..shader = gradient.createShader(rectShape);

    canvas.drawPath(path, paint);
  }

  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}