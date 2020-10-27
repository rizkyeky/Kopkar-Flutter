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
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
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
                onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MainPage())), 
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
