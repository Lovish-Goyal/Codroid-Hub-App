import 'package:codroid_hub/auth/auth_controller.dart';
import 'package:codroid_hub/utils/loading_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController email =
      TextEditingController(text: kDebugMode ? "lovish1@gmail.com" : "");
  final TextEditingController pass =
      TextEditingController(text: kDebugMode ? "lovish12" : "");
  bool _obscureText = true;

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.read(authControllerProvider.notifier);
    final isLoadingState = ref.watch(authControllerProvider);

    return Scaffold(
      body: isLoadingState
          ? const LoadingPage()
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Color(0xFF8A2387),
                        Color(0xFFE94057),
                        Color(0xFFF27121)
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 130,
                      ),
                      // Image.asset("images/logo.png"),

                      const SizedBox(height: 10),

                      Container(
                        height: 550,
                        width: 325,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),
                            const Text('Welcome to Login',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 70),
                            SizedBox(
                              width: 250,
                              child: TextField(
                                  controller: email,
                                  decoration: const InputDecoration(
                                    labelText: 'Email Address',
                                    suffixIcon: Icon(FontAwesomeIcons.envelope,
                                        size: 17),
                                  )),
                            ),
                            SizedBox(
                                width: 250,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: pass,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Enter your password',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 40, 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text(
                                                        'Sorry!',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Color(0xFF4C53A5),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      const Text(
                                                        'This function is not working yet',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              const Color(
                                                                  0xFF4C53A5),
                                                        ),
                                                        child: const Text('Ok'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text("Forgot Password?",
                                            style: TextStyle(
                                                color:
                                                    Colors.orangeAccent[700])))
                                  ],
                                )),
                            GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xFF8A2387),
                                            Color(0xFFE94057),
                                            Color(0xFFF27121)
                                          ])),
                                  child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text('Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))),
                                ),
                                onTap: () async {
                                  auth.login(email.text, pass.text, context);
                                }),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Row(
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                  ),
                                  TextButton(
                                      onPressed: () => context.push('/signup'),
                                      child: Text('Sign up',
                                          style: TextStyle(
                                              color: Colors.orangeAccent[700])))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
