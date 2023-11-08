import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as devtools show log;

import 'package:studimi/constants/routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool passwordVisible = false;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
    passwordVisible = true;
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 84, 85, 1),
      appBar: AppBar(
        elevation: 10,
        shadowColor: const Color.fromRGBO(249, 245, 235, 1),
        backgroundColor: const Color.fromRGBO(0, 43, 91, 1),
        centerTitle: true,
        title: Text(
          'REGISTER',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your E-mail here',
                  fillColor: Color.fromARGB(255, 211, 211, 211),
                  filled: true,
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _password,
                obscureText: passwordVisible,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Enter your password here',
                  fillColor: const Color.fromARGB(255, 211, 211, 211),
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  alignLabelWithHint: false,
                ),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  final user = FirebaseAuth.instance.currentUser;
                  await user?.sendEmailVerification();
                  Navigator.of(context).pushNamed(verifyEmailRoute);
                  // devtools.log(userCredential.toString());
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    Fluttertoast.showToast(
                        msg: "Weak Password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: const Color.fromARGB(203, 255, 58, 44),
                        textColor: Colors.white,
                        fontSize: 20.0);
                    devtools.log('Weak Password');
                  } else if (e.code == 'email-already-in-use') {
                    Fluttertoast.showToast(
                        msg: "Email already in use",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: const Color.fromARGB(203, 255, 58, 44),
                        textColor: Colors.white,
                        fontSize: 20.0);
                    devtools.log('Email already in use');
                  } else if (e.code == 'invalid-email') {
                    Fluttertoast.showToast(
                        msg: "Invalid Email",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: const Color.fromARGB(203, 255, 58, 44),
                        textColor: Colors.white,
                        fontSize: 20.0);
                    devtools.log('Innalid Email');
                  }
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(218, 255, 251, 1.0),
              ),
              child: Text(
                'Register',
                style: GoogleFonts.novaOval(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    loginRoute,
                    (route) => false,
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(218, 255, 251, 1.0),
                ),
                child: Text(
                  'Already registered? Login here...',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
