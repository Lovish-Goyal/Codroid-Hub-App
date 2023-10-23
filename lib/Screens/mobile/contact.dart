import 'dart:io';
import 'package:codroid_hub/Screens/web/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MobContactPage extends ConsumerStatefulWidget {
  const MobContactPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobContactPageState();
}

class _MobContactPageState extends ConsumerState<MobContactPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 248, 248),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 154, 150, 150),
        title: Text(
          "Contact us",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 154, 150, 150),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(60))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Noida,Ambala,Patna,Haryana 133004",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Phone: +(91) 9138555661",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const Text(
                    "Email: programmanager@codroidhub.com",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () async {
                            String telephoneNumber = '+919138555661';
                            var telephoneUrl =
                                Uri.parse("tel:$telephoneNumber");
                            if (Platform.isAndroid || Platform.isIOS) {
                              await launchUrl(telephoneUrl);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Unable to make calls"),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.phone,
                            size: 40,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () async {
                            String email = 'programmanager@codroidhub.com';
                            String subject = 'Hello Guys';
                            String body = 'Welcome to codroidHub';

                            var emailUrl = Uri.parse(
                                "mailto:$email?subject=$subject&body=$body");

                            if (await canLaunchUrl(emailUrl)) {
                              await launchUrl(emailUrl);
                            } else if (Platform.isAndroid || Platform.isIOS) {
                              await launchUrl(emailUrl);
                            } else {
                              // throw "Error occured sending an email";
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Unable to send Email"),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.email,
                            size: 40,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () async {
                            var phone = "+919138555661";
                            var iosUrl = Uri.parse(
                                "https://wa.me/$phone?text=Hi, I need some help");
                            var url = Uri.parse(
                                "https://wa.me/$phone?text=Hey buddy, try this super cool new app!");
                            var whatsappAndroid = Uri.parse(
                                "whatsapp://send?phone=$phone&text=hello🖐️ Welcome to our app");
                            if (Platform.isIOS) {
                              await launchUrl(iosUrl);
                            } else if (Platform.isAndroid) {
                              await launchUrl(whatsappAndroid);
                            } else if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Unable to find Whatsapp"),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            FontAwesomeIcons.whatsapp,
                            size: 40,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 154, 150, 150),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(border: Border.all()),
                              child: TextFormField(
                                controller: namecontroller,
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(border: Border.all()),
                              child: TextFormField(
                                controller: emailcontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (value.isValidEmail == false) {
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(border: Border.all()),
                              child: TextFormField(
                                controller: phonecontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Mobile';
                                  } else if (value.isValidPhone == false) {
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: TextFormField(
                                controller: messagecontroller,
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
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    {
                                      try {
                                        const phoneNumber = "+918607605196";
                                        if (Platform.isAndroid) {
                                          String uri =
                                              'sms:$phoneNumber?body=user details who wants to connect with codroidhub app" Name: ${namecontroller.text.toString()}", "Email: ${emailcontroller.text.toString()}", "Phone: ${phonecontroller.text.toString()}","Message: ${messagecontroller.text.toString()}"';
                                          await launchUrl(Uri.parse(uri));
                                        } else if (Platform.isIOS) {
                                          String uri =
                                              'sms:$phoneNumber&body=${Uri.encodeComponent("Hello there")}';
                                          await launchUrl(Uri.parse(uri));
                                        }
                                      } catch (e) {
                                        if (!mounted) return;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Some error occurred. Please try again!'),
                                          ),
                                        );
                                      }
                                    }
                                  }
                                  if (!mounted) return;
                                  Navigator.pop(context);
                                },
                                child: const Text("Submit"))
                          ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
