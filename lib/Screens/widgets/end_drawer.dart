import 'package:flutter/material.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            //header of drawer
            decoration: BoxDecoration(
                color: Colors.redAccent,
                image: DecorationImage(
                    image: NetworkImage(
                        "data:image/png;base64,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"),
                    fit: BoxFit.cover)),
            child: Text(
              'My Drawer Header',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            //menu item of Drawer
            leading: Icon(Icons.home),
            title: Text('Home Page'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Favourite'),
          ),
           ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Order'),
          ),
           ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Account Settings'),
          ),
          ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.close),
              title: Text("Close Drawer"))
        ],
      ),
    );
  }
}
