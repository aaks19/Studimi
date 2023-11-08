import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studimi/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
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
          'EMAIL VERIFICATION',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "We'ev already sent the verification email , check your mail. Otherwise click on the button below.",
                style: TextStyle(
                  color: Color.fromARGB(255, 247, 247, 247),
                  fontSize: 15,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Verify your email',
                style: TextStyle(
                  color: Color.fromARGB(255, 247, 247, 247),
                  fontSize: 25,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(218, 255, 251, 1.0),
              ),
              child: Text(
                'Send Verification',
                style: GoogleFonts.novaOval(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(218, 255, 251, 1.0),
              ),
              child: Text(
                'Go to Login!',
                style: GoogleFonts.novaOval(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(218, 255, 251, 1.0),
              ),
              child: Text(
                'Restart',
                style: GoogleFonts.novaOval(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
