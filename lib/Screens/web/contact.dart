import 'package:codroid_hub/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../widgets/end_drawer.dart';
import '../../widgets/footer.dart';

class WebContactPage extends StatefulWidget {
  const WebContactPage({super.key});

  @override
  State<WebContactPage> createState() => _WebContactPageState();
}

class _WebContactPageState extends State<WebContactPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.black87,
          title: appBarhelper(context)),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 240,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("images/contact1.jpg", fit: BoxFit.cover),
                  ColoredBox(
                      color: Colors.black.withOpacity(0.9) // 0: Light, 1: Dark
                      ),
                  Container(
                    margin: const EdgeInsets.all(46),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Contact Us",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                        Text(
                          "We are eager to discuss your needs, and answers any questions you may have. Enter your details and we`ll get back to you shortly.",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 300,
            //   child: Image.asset("images/contact1.jpg",fit: BoxFit.cover),
            // ),
            ResponsiveGridRow(children: [
              ResponsiveGridCol(
                  xl: 6,
                  lg: 2,
                  md: 12,
                  sm: 12,
                  xs: 12,
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[400],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            "Get in touch",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            "CodroidHub is the number one company in the field of Technology",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.home,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                      width: 200,
                                      child: Text(
                                          "Head Office:-Flat No. K-401 NTPC Shanti Vihar – Khajpura, Patna – Bihar, India – 800014"))
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.phone_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone NUmber",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("(+91) 9138555663")
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.email_outlined,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email Address",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("programmanager@codroidhub.com")
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              ResponsiveGridCol(
                  xl: 6,
                  lg: 2,
                  md: 12,
                  sm: 12,
                  xs: 12,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            "Enter Details",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Name",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(16.0),
                                        hintText: "Your name",
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Your Email",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your email';
                                        } else if (value.isValidEmail ==
                                            false) {
                                          return "Please enter a valid email address";
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(16.0),
                                        hintText: "Enter your email address",
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Your Phone",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your Mobile';
                                        } else if (value.isValidPhone ==
                                            false) {
                                          return "Please enter a valid Mobile Number ";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(16.0),
                                        hintText: "(+91) Phone Number",
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Message",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your Message';
                                        }
                                        return null;
                                      },
                                      maxLines: 10,
                                      minLines: 5,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(16.0),
                                        hintText: "Enter Your Message",
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text("Success"),
                                                  content: const Text(
                                                      "Form Submitted Successfully"),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text("OK"))
                                                  ],
                                                );
                                              });
                                        }
                                      },
                                      child: const Text("Submit"))
                                ]),
                          )
                        ],
                      ),
                    ),
                  )),
            ]),
            (MediaQuery.of(context).size.width > 700)
                ? const Footer()
                : const MobileFooter()
          ],
        ),
      ),
      endDrawer:
          MediaQuery.of(context).size.width < 700 ? const EndDrawer() : null,
    );
  }
}

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  //REMINDER: This is not a good way to check if a string is null or empty
  //use   (!String.isEmpty)  instead
  // bool get isNotNull {

  //   return this.length != 0;
  // }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool isMobileNumberValid() {
    String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    var regExp = RegExp(regexPattern);

    if (isEmpty) {
      return false;
    } else if (regExp.hasMatch(this)) {
      return true;
    }
    return false;
  }
}
