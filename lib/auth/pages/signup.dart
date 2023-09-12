import 'package:codroid_hub/auth/auth_controller.dart';
import 'package:codroid_hub/auth/model/user_model.dart';
import 'package:codroid_hub/auth/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class SignUpCustomAlertBox extends ConsumerStatefulWidget {
  const SignUpCustomAlertBox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignUpCustomAlertBoxState();
}

class _SignUpCustomAlertBoxState extends ConsumerState<SignUpCustomAlertBox> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmpass = TextEditingController();
  bool _obscureTextpass = true;
  bool _obscureTextconfirmpass = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(vertical: 80),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Register to"),
            SizedBox(
              width: 5,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Codroid', style: TextStyle(color: Colors.black)),
              TextSpan(text: 'Hub', style: TextStyle(color: Colors.blue))
            ]))
          ],
        ),
        content: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text("Name")),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Icon(Icons.email_outlined)),
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 300,
                        child: TextFormField(
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText: 'Name'),
                        )),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text("Useremail")),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Icon(Icons.email_outlined)),
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 300,
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
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              hintText: 'Email'),
                        )),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text("Password")),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Icon(Icons.password)),
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 300,
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
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureTextpass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureTextpass = !_obscureTextpass;
                                });
                              },
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text("Confirm Password")),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Icon(Icons.password)),
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 300,
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
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            hintText: 'Confirm your password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureTextconfirmpass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureTextconfirmpass =
                                      !_obscureTextconfirmpass;
                                });
                              },
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
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
                    child: const Text("Signup")),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {},
                      child: TextButton(
                          onPressed: () => showDialogLogin(context),
                          child: const Text('Login',
                              style: TextStyle(color: Colors.blue))))
                ],
              ),
            ])));
  }
}

void showDialogSignUp(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const SignUpCustomAlertBox();
    },
  );
}
