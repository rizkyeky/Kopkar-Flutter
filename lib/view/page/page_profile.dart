part of 'page.dart';

class ProfilePage extends Page<ProfileBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('KOPKAR'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Material(
              color: primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 42,
                  ),
                  const SizedBox(height: 12,),
                  Text('Nama', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),)
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('Nama'),
            trailing: Icon(Icons.edit),
            onLongPress: () {},
            subtitle: Text('Nama untuk akun ini'),
          )
        ],
      ),
    );
  }
}