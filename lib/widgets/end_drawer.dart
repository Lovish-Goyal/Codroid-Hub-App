import 'package:codroid_hub/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
          const SizedBox(
            height: 180,
            child: DrawerHeader(
              //header of drawer
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  image: DecorationImage(
                      image: AssetImage("assets/images/codroidLogo.jpg"),
                      fit: BoxFit.fill)),
              child: Text(
                'My Drawer Header',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ListTile(
            //menu item of Drawer
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Contact'),
            onTap: () => context.go('/contact'),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('About'),
            onTap: () => context.go('/about'),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('My Cart'),
            onTap: () => context.go('/cart'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Courses'),
            onTap: () => context.go('/courses'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Services'),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () => context.go('/login'),
          ),
          ListTile(
            leading: const Icon(Icons.app_registration_rounded),
            title: const Text('SignUp'),
            onTap: () => context.go('/signup'),
          ),
          ListTile(
            onTap: () {
              auth.logout(context);
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
          ListTile(
              onTap: () => context.push('/addCourses'),
              leading: const Icon(Icons.add),
              title: const Text("Add Courses")),
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
