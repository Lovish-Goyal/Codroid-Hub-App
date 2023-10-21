import 'package:codroid_hub/auth/auth_controller.dart';
import 'package:codroid_hub/auth/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginCustomAlert extends ConsumerStatefulWidget {
  const LoginCustomAlert({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomAlertBoxState();
}

class _CustomAlertBoxState extends ConsumerState<LoginCustomAlert> {
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
    // final isLoadingState = ref.watch(authControllerProvider);

    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 110),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login to"),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {}, child: const Text("Forgot Password ?"))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      auth.login(email.text, pass.text, context);
                    }
                  },
                  child: const Text("Login")),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("NEW USER?"),
                TextButton(
                    onPressed: () => showDialogSignUp(context),
                    child: const Text('Sign up',
                        style: TextStyle(color: Colors.blue)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showDialogLogin(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const LoginCustomAlert();
    },
  );
}

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }
}
