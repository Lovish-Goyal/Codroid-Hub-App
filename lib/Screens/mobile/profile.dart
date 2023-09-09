import 'package:codroid_hub/Screens/mobile/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    // if (user == null) {
    //   context.go(RouteKey.login);
    //   return const SizedBox.shrink();
    // }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        backgroundColor: Colors.black87,
        title: Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(25),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                        "https://3.bp.blogspot.com/-UI5bnoLTRAE/VuU18_s6bRI/AAAAAAAADGA/uafLtb4ICCEK8iO3NOh1C_Clh86GajUkw/s1600/guest.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    // Text(user.fullName),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "user@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    // Text(user.email),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Text(
                  "More Information",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            ProfileList(
              icon: Icons.notifications,
              text: 'Notifications',
              onTap: () {},
            ),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            ProfileList(
              icon: Icons.person_2_outlined,
              text: 'About Us',
              onTap: () => context.push('/about'),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            ProfileList(
              icon: Icons.contact_page_outlined,
              text: 'Contact Us',
              onTap: () => context.push('/contact'),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            ProfileList(
              icon: Icons.takeout_dining,
              text: 'Enrolled Courses',
              onTap: () {},
            ),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            ProfileList(
              icon: Icons.developer_board_outlined,
              text: 'Services',
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Services();
              })),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            ProfileList(
              icon: Icons.policy_outlined,
              text: 'Policies',
              onTap: () {},
            ),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            ProfileList(
              icon: Icons.logout,
              text: 'Sign Out',
              onTap: () => context.go('/signupPage'),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class ProfileList extends StatelessWidget {
  final IconData icon;
  final String text;
  final onTap;
  const ProfileList({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Icon(icon, size: 26, color: Colors.black54),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
