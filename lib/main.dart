import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studimi/class/books.dart';
import 'package:studimi/class/class_notes.dart';
import 'package:studimi/class/cse/cse_notes.dart';
import 'package:studimi/class/ee/ee_notes.dart';
import 'package:studimi/class/etc/etc_notes.dart';
import 'package:studimi/class/mech/mech_notes.dart';
import 'package:studimi/class/first/first_notes.dart';
import 'package:studimi/constants/routes.dart';
import 'package:studimi/views/login_view.dart';
import 'package:studimi/views/register_view.dart';
import 'package:studimi/views/verify_email_view.dart';
import 'class/ce/ce_notes.dart';
import 'firebase_options.dart';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Studimi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        notesRoute: (context) => const NotesView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        notesDoRoute: (context) => const Notes(),
        firstYearRoute: (context) => const FirstYear(),
        cseRoute: (context) => const Cse(),
        mechRoute: (context) => const Mech(),
        etcRoute: (context) => const Etc(),
        eeRoute: (context) => const Electrical(),
        ceRoute: (context) => const Civil(),
        sem1Route: (context) => const Sem1(),
        sem2Route: (context) => const Sem2(),
        cseSem3Route: (context) => const CseSem3(),
        cseSem4Route: (context) => const CseSem4(),
        cseSem5Route: (context) => const CseSem5(),
        cseSem6Route: (context) => const CseSem6(),
        cseSem7Route: (context) => const CseSem7(),
        cseSem8Route: (context) => const CseSem8(),
        mechSem3Route: (context) => const MechSem3(),
        mechSem4Route: (context) => const MechSem4(),
        mechSem5Route: (context) => const MechSem5(),
        mechSem6Route: (context) => const MechSem6(),
        mechSem7Route: (context) => const MechSem7(),
        mechSem8Route: (context) => const MechSem8(),
        etcSem3Route: (context) => const EtcSem3(),
        etcSem4Route: (context) => const EtcSem4(),
        etcSem5Route: (context) => const EtcSem5(),
        etcSem6Route: (context) => const EtcSem6(),
        etcSem7Route: (context) => const EtcSem7(),
        etcSem8Route: (context) => const EtcSem8(),
        elecSem3Route: (context) => const EESem3(),
        elecSem4Route: (context) => const EESem4(),
        elecSem5Route: (context) => const EESem5(),
        elecSem6Route: (context) => const EESem6(),
        elecSem7Route: (context) => const EESem7(),
        elecSem8Route: (context) => const EESem8(),
        civilSem3Route: (context) => const CESem3(),
        civilSem4Route: (context) => const CESem4(),
        civilSem5Route: (context) => const CESem5(),
        civilSem6Route: (context) => const CESem6(),
        civilSem8Route: (context) => const CESem8(),
        civilSem7Route: (context) => const CESem7(),
        bookroute: (context) => const BookEng(),
      },
    ),
  );
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/icon/splash.gif',
      ),
      backgroundColor: const Color.fromRGBO(196, 223, 223, 1.0),
      nextScreen: const NotesView(),
      // splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                return const Notes();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const Splash();
        }
      },
    );
  }
}

enum MenuAction { logout }

// main ui of the app
class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

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
            'STUDIMI',
            style: GoogleFonts.novaOval(
                textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            )),
          ),
          actions: [
            PopupMenuButton<MenuAction>(
              onSelected: (value) async {
                switch (value) {
                  case MenuAction.logout:
                    final shouldLogout = await showLogoutDialog(context);
                    if (shouldLogout) {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                        (_) => false,
                      );
                    }
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem<MenuAction>(
                    value: MenuAction.logout,
                    child: Text('Logout'),
                  ),
                ];
              },
            )
          ],
        ),
        body: Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(50, 150, 50, 0),
          padding: const EdgeInsets.only(top: 100),
          // alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(29, 93, 155, 1),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(249, 245, 235, 1),
                  blurRadius: 20,
                  spreadRadius: 15.0,
                ),
              ]),
          child: Column(
            children: [
              Text(
                'Hello Students',
                textAlign: TextAlign.center,
                // style: TextStyle(
                //   fontSize: 35,
                //   color: Color.fromARGB(255, 0, 0, 0),
                // ),
                style: GoogleFonts.novaOval(
                  textStyle: TextStyle(
                    fontSize: 50,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(50, 30),
                        const Offset(200, 10),
                        <Color>[
                          const Color.fromRGBO(203, 255, 169, 1),
                          const Color.fromRGBO(255, 254, 196, 1.0),
                        ],
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(218, 255, 251, 1.0),
                    textStyle: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  child: Text(
                    'Learn',
                    style: GoogleFonts.novaOval(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(234, 84, 85, 1),
        appBar: AppBar(
          shadowColor: const Color.fromRGBO(218, 255, 251, 1.0),
          backgroundColor: const Color.fromRGBO(0, 43, 91, 1),
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            'Notes',
            style: GoogleFonts.novaOval(
                textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            )),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                //first year
                onPressed: () {
                  Navigator.pushNamed(context, firstYearRoute);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 204, 204),
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                child: Text(
                  'First Year',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                //cse
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "Coming Soon...",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: const Color.fromRGBO(74, 85, 162, 1),
                      textColor: const Color.fromRGBO(245, 239, 231, 1),
                      fontSize: 30.0);

                  // Navigator.pushNamed(context, cseRoute);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 204, 204),
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                child: Text(
                  'Computer Science and Engineering',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "Coming Soon...",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: const Color.fromRGBO(74, 85, 162, 1),
                      textColor: const Color.fromRGBO(245, 239, 231, 1),
                      fontSize: 30.0);

                  // Navigator.pushNamed(context, mechRoute);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 204, 204),
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                child: Text(
                  'Mechanical Engineering',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "Coming Soon...",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: const Color.fromRGBO(74, 85, 162, 1),
                      textColor: const Color.fromRGBO(245, 239, 231, 1),
                      fontSize: 30.0);

                  // Navigator.pushNamed(context, etcRoute);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 204, 204),
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                child: Text(
                  'Electronics & Telecommunication',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "Coming Soon...",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: const Color.fromRGBO(74, 85, 162, 1),
                      textColor: const Color.fromRGBO(245, 239, 231, 1),
                      fontSize: 30.0);

                  // Navigator.pushNamed(context, eeRoute);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 204, 204),
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                child: Text(
                  'Electrical Engineering',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "Coming Soon...",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      backgroundColor: const Color.fromRGBO(74, 85, 162, 1),
                      textColor: const Color.fromRGBO(245, 239, 231, 1),
                      fontSize: 30.0);

                  // Navigator.pushNamed(context, ceRoute);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 204, 204),
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                child: Text(
                  'Civil Engineering',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: () {
                  // Fluttertoast.showToast(
                  //     msg: "Coming Soon...",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.BOTTOM,
                  //     timeInSecForIosWeb: 3,
                  //     backgroundColor: const Color.fromRGBO(74, 85, 162, 1),
                  //     textColor: const Color.fromRGBO(245, 239, 231, 1),
                  //     fontSize: 30.0);

                  Navigator.pushNamed(context, bookroute);
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 204, 204),
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                child: Text(
                  'Books',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
        // FutureBuilder<ListResult>(
        //   future: futureFiles,
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       final files = snapshot.data!.items;

        //       return ListView.builder(
        //         itemCount: files.length,
        //         itemBuilder: (context, index) {
        //           final file = files[index];

        //           return ListTile(
        //             title: Text(file.name),
        //             trailing: IconButton(
        //               icon: const Icon(
        //                 Icons.download,
        //                 color: Colors.black,
        //               ),
        //               onPressed: () => downloadFile(file),
        //             ),
        //           );
        //         },
        //       );
        //     } else if (snapshot.hasError) {
        //       return const Center(
        //         child: Text('An Error Ocurred'),
        //       );
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
        );
  }
}

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Sign-Out'),
        content: const Text('Are you sure,you want to sign-out ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes'),
          )
        ],
      );
    },
  ).then((value) => value ?? false);
}
