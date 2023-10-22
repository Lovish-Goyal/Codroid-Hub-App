import 'package:codroid_hub/auth/model/user_model.dart';
import 'package:codroid_hub/auth/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../auth/auth_controller.dart';

class MobSignUp extends ConsumerStatefulWidget {
  const MobSignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobSignUpState();
}

class _MobSignUpState extends ConsumerState<MobSignUp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureTextpass = true;
  bool _obscureTextconfirmpass = true;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(50)),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(
                      top: 70,
                    ),
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
                  // Container(
                  //     height: 120,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     margin: EdgeInsets.only(top: 80, left: 20),
                  //     child: Image.asset('assets/images/codroidLogo.jpg')
                  //     ),
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text("Create New Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30)),
                      ),
                    ],
                  ),

                  // Name
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]?.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.person_2_outlined,
                                  size: 30,
                                )),
                            hintText: 'Name',
                            hintStyle: TextStyle(fontSize: 22)),
                        style: TextStyle(),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),

                  // Email
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]?.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16)),
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
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.email,
                                  size: 25,
                                )),
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 18)),
                        style: TextStyle(),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),

                  // Password
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]?.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Password';
                          } else if (value.length < 8) {
                            return 'password should be greater than 8 digits';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: pass,
                        obscureText: _obscureTextpass,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.lock,
                                  size: 25,
                                )),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureTextpass
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureTextpass = !_obscureTextpass;
                                });
                              },
                            ),
                            hintStyle: TextStyle()),
                        style: TextStyle(fontSize: 18),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ),

                  // Confirm password
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]?.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Again Enter your password';
                          } else if (pass.text != confirmpass.text) {
                            return "Password doesn`t match";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: confirmpass,
                        obscureText: _obscureTextconfirmpass,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(
                                  Icons.lock,
                                  size: 25,
                                )),
                            hintText: 'Confirm Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureTextconfirmpass
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureTextconfirmpass =
                                      !_obscureTextconfirmpass;
                                });
                              },
                            ),
                            hintStyle: TextStyle()),
                        style: TextStyle(fontSize: 18),
                        textInputAction: TextInputAction.done,
                      ),
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
                                final UserModel user = UserModel(
                                  name: name.text,
                                  email: email.text,
                                  id: const Uuid().v4(),
                                );
                                ref
                                    .watch(authControllerProvider.notifier)
                                    .signUp(user, pass.text, context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    });
                                // final auth = UserModel(
                                //   name: name.text,
                                //   email: email.text,
                                // );
                                // ref
                                //     .read(authControllerProvider.notifier)
                                //     .signUp(auth, pass.text, context);
                              }
                            },
                            child: const Text(
                              "SignUp",
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
                          "Already have an account ?",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () => context.push('/login'),
                            child: const Text('Login',
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
