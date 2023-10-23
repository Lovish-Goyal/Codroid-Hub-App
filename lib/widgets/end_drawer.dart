import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final auth = ref.read(authControllerProvider.notifier);
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
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.contact_page_outlined),
            title: const Text('Contact'),
            onTap: () => context.push('/contact'),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('About'),
            onTap: () => context.push('/about'),
          ),
          ListTile(
            leading: Icon(Icons.design_services_outlined),
            title: Text('Services'),
            onTap: () => context.push('/services'),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () => context.go('/login'),
          ),
          kIsWeb
              ? SizedBox()
              : ListTile(
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
