import 'package:flutter/material.dart';
import '../constants/string_constants.dart';
import '../pages/login_page.dart';

class DrawerWidget extends StatelessWidget {

  String email;

  DrawerWidget({
    Key? key,required
    this.email,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           UserAccountsDrawerHeader(
            accountEmail: Text(email),
            accountName: const Text('Bem Vindo!'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title:  const Text(StringConstants.myAcount),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(color: Colors.grey),
           const ListTile(
            leading: Icon(Icons.add),
            title: Text(StringConstants.settings),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            leading: const Icon(Icons.input_rounded),
            title: const Text(StringConstants.close),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
            },
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
