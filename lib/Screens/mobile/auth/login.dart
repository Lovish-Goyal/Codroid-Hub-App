import 'package:codroid_hub/Screens/web/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/auth_controller.dart';

class MobLogin extends ConsumerStatefulWidget {
  const MobLogin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobLoginState();
}

class _MobLoginState extends ConsumerState<MobLogin> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.read(authControllerProvider.notifier);
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.transparent]).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuF3vTRYX_cAUBLzBXpd5E29VgZk3sga8Bry-b7KonP3YL-9uPalFSvBLtBvHJ_CHYiwU&usqp=CAU"),
                    fit: BoxFit.fill,
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken))),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.all(20),
                      child: Text.rich(
                          TextSpan(style: TextStyle(fontSize: 25), children: [
                        TextSpan(
                            text: 'C',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 50)),
                        TextSpan(
                            text: 'H',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 50))
                      ])),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(
                      20,
                    ),
                    child: Text("Welcome back",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35)),
                  ),

                  Container(
                    height: 60,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Icon(Icons.email_outlined)),
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 250,
                            child: TextFormField(
                              controller: email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                } else if (value.isValidEmail == false) {
                                  return "Please enter a valid email address";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  hintText: 'Email'),
                            )),
                      ],
                    ),
                  ),

                  // Email
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 10),
                  //     height: 70,
                  //     decoration: BoxDecoration(
                  //         color: Colors.grey[500]?.withOpacity(0.5),
                  //         borderRadius: BorderRadius.circular(16)),
                  //     child: TextFormField(
                  //       controller: email,
                  //       validator: (value) {
                  //         if (value!.isEmpty) {
                  //           return 'Please enter your email';
                  //         } else if (value.isValidEmail == false) {
                  //           return "Please enter a valid email address";
                  //         }
                  //         return null;
                  //       },
                  //       decoration: InputDecoration(
                  //           border: InputBorder.none,
                  //           prefixIcon: Padding(
                  //               padding: EdgeInsets.symmetric(horizontal: 20),
                  //               child: Icon(
                  //                 Icons.email,
                  //                 size: 25,
                  //               )),
                  //           hintText: 'Email',
                  //           hintStyle: TextStyle(fontSize: 18)),
                  //       style: TextStyle(),
                  //       keyboardType: TextInputType.emailAddress,
                  //       textInputAction: TextInputAction.next,
                  //     ),
                  //   ),
                  // ),

                  // Password
                  Container(
                    height: 60,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Icon(Icons.password)),
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 250,
                            child: TextFormField(
                              controller: pass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                hintText: 'Enter your password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 10),
                  //     height: 70,
                  //     decoration: BoxDecoration(
                  //         color: Colors.grey[500]?.withOpacity(0.5),
                  //         borderRadius: BorderRadius.circular(16)),
                  //     child: TextFormField(
                  //       controller: pass,
                  //       validator: (value) {
                  //         if (value!.isEmpty) {
                  //           return 'Please enter your password';
                  //         }
                  //         return null;
                  //       },
                  //       keyboardType: TextInputType.text,
                  //       obscureText: _obscureText,
                  //       decoration: InputDecoration(
                  //           border: InputBorder.none,
                  //           prefixIcon: Padding(
                  //               padding: EdgeInsets.symmetric(horizontal: 20),
                  //               child: Icon(
                  //                 Icons.lock,
                  //                 size: 25,
                  //               )),
                  //           hintText: 'Password',
                  //           suffixIcon: IconButton(
                  //             icon: Icon(
                  //               _obscureText
                  //                   ? Icons.visibility_off
                  //                   : Icons.visibility,
                  //             ),
                  //             onPressed: () {
                  //               setState(() {
                  //                 _obscureText = !_obscureText;
                  //               });
                  //             },
                  //           ),
                  //           hintStyle: TextStyle()),
                  //       style: TextStyle(fontSize: 18),
                  //       textInputAction: TextInputAction.done,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Text(
                            "Forgot password ?",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[400]),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                auth.login(email.text, pass.text, context);
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "NEW USER?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () => context.push('/signup'),
                            child: const Text('Sign Up',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 18)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
