import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth/pages/login.dart';
import '../auth/pages/signup.dart';

Widget appBarhelper(BuildContext context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Row(
          children: [
            Text.rich(TextSpan(
                style: TextStyle(fontSize: 35), //apply style to all
                children: [
                  TextSpan(
                      text: 'Codroid', style: TextStyle(color: Colors.white)),
                  TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue))
                ]))
          ],
        ),
        if (MediaQuery.of(context).size.width > 700)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => context.go('/'),
                  child: const Text(
                    "Home",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () => context.go('/contact'),
                  child: const Text(
                    "Contact Us",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () => context.go('/about'),
                  child: const Text(
                    "About Us",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () => context.go('/courses'),
                  child: const Text(
                    "Courses",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                  TextButton(
                  onPressed: () => context.go('/cart'),
                  child: const Text(
                    "MyCart",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        if (MediaQuery.of(context).size.width > 900)
          Row(
            children: [
              TextButton(
                  onPressed: () => showDialogLogin(context),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              const Text(
                "/",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                  onPressed: () => showDialogSignUp(context),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              // TextButton(
              //     onPressed: () => context.push('/createCourse'),
              //     child: const Text(
              //       "create course",
              //       style: TextStyle(
              //           color: Colors.white, fontWeight: FontWeight.bold),
              //     )),
            ],
          )
      ],
  );
}
