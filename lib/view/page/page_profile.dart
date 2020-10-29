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
        title: const Text('KOPKAR'),
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
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Nama'),
            trailing: const Icon(Icons.edit),
            onLongPress: () {},
            subtitle: const Text('Ganti nama untuk akun ini'),
          )
        ],
      ),
    );
  }
}