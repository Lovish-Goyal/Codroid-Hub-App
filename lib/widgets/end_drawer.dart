import 'package:codroid_hub/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authControllerProvider.notifier);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            //header of drawer
            decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                    image: AssetImage("assets/images/codroidLogo.jpg"),
                    fit: BoxFit.cover)),
            child: Text(
              'My Drawer Header',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const ListTile(
            //menu item of Drawer
            leading: Icon(Icons.home),
            title: Text('Home Page'),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Favourite'),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Order'),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Account Settings'),
          ),
          ListTile(
            onTap: () {
              auth.logout(context);
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
          ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.close),
              title: const Text("Close Drawer"))
        ],
      ),
    );
  }
}
