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
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmpass = TextEditingController();
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
    // final auth = ref.read(authControllerProvider.notifier);
    // final isLoadingState = ref.watch(authControllerProvider);

    return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(vertical: 100),
        title: const Center(child: Text("SignUp to CodroidHUb")),
        content: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text("Username")),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Icon(Icons.email_outlined)),
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 400,
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
                        width: 400,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Password';
                            } else if (value.length > 8) {
                              return "Please enter 8 digit password";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          controller: pass,
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
                        width: 400,
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
                          obscureText: _obscureText,
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
                          name: email.text,
                          email: email.text,
                          id: const Uuid().v4(),
                        );
                        ref
                            .watch(authControllerProvider.notifier)
                            .signUp(user, pass.text, context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Success"),
                                content:
                                    const Text("Form Submitted Successfully"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("OK"))
                                ],
                              );
                            });
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
