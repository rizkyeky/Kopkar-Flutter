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
      appBar: AppBar(
        
      ),
      body: Builder(
        builder: (contextScaffold) => SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 36,),
              XTextField(
                controller: _emailText,
                text: 'Email',
              ),
              const SizedBox(height: 36,),
              XTextField(
                obscureText: true,
                controller: _passwordText,
                text: 'Password',
              ),
              const SizedBox(height: 36,),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {}, 
        label: Text('Login', style: appTheme.textTheme.headline2.copyWith(),)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}