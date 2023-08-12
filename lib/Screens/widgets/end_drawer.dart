import 'package:flutter/material.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: const [
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              "Contact Us",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              "About Us",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              "Our Team",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              "Services",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
