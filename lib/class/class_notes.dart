import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studimi/constants/routes.dart';

//                                     FIRST YEAR

class FirstYear extends StatefulWidget {
  const FirstYear({Key? key}) : super(key: key);

  @override
  State<FirstYear> createState() => _FirstYearState();
}

class _FirstYearState extends State<FirstYear> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/First Year').listAll();
  }

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
        // backgroundColor: const Color.fromRGBO(14, 41, 84, 1.0),
        title: Text(
          'FIRST YEAR',
          style: GoogleFonts.novaOval(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(sem1Route);
                },
                child: Text(
                  'Semester 1',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(sem2Route);
                },
                child: Text(
                  'Semester 2',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//                                             CSE

class Cse extends StatefulWidget {
  const Cse({Key? key}) : super(key: key);

  @override
  State<Cse> createState() => _CseState();
}

class _CseState extends State<Cse> {
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
        // backgroundColor: const Color.fromRGBO(14, 41, 84, 1.0),
        title: Text(
          'Computer Science & Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(cseSem3Route);
                },
                child: Text(
                  'Semester 3',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(cseSem4Route);
                },
                child: Text(
                  'Semester 4',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(cseSem5Route);
                },
                child: Text(
                  'Semester 5',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(cseSem6Route);
                },
                child: Text(
                  'Semester 6',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(cseSem7Route);
                },
                child: Text(
                  'Semester 7',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(cseSem8Route);
                },
                child: Text(
                  'Semester 8',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//                                           MECH

class Mech extends StatefulWidget {
  const Mech({Key? key}) : super(key: key);

  @override
  State<Mech> createState() => _MechState();
}

class _MechState extends State<Mech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 84, 85, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(164, 197, 134, 1.0),
        backgroundColor: const Color.fromRGBO(0, 43, 91, 1),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        // backgroundColor: const Color.fromRGBO(14, 41, 84, 1.0),
        title: Text(
          'Mechanical Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(mechSem3Route);
                },
                child: Text(
                  'Semester 3',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(mechSem4Route);
                },
                child: Text(
                  'Semester 4',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(mechSem5Route);
                },
                child: Text(
                  'Semester 5',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(mechSem6Route);
                },
                child: Text(
                  'Semester 6',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(mechSem7Route);
                },
                child: Text(
                  'Semester 7',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(mechSem8Route);
                },
                child: Text(
                  'Semester 8',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//                                          ETC

class Etc extends StatefulWidget {
  const Etc({Key? key}) : super(key: key);

  @override
  State<Etc> createState() => _EtcState();
}

class _EtcState extends State<Etc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 84, 85, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(164, 197, 134, 1.0),
        backgroundColor: const Color.fromRGBO(0, 43, 91, 1),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        // backgroundColor: const Color.fromRGBO(14, 41, 84, 1.0),
        title: Text(
          'Electronics & Telecommunication',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(etcSem3Route);
                },
                child: Text(
                  'Semester 3',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(etcSem4Route);
                },
                child: Text(
                  'Semester 4',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(etcSem5Route);
                },
                child: Text(
                  'Semester 5',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(etcSem6Route);
                },
                child: Text(
                  'Semester 6',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(etcSem7Route);
                },
                child: Text(
                  'Semester 7',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(etcSem8Route);
                },
                child: Text(
                  'Semester 8',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//                                          EE

class Electrical extends StatefulWidget {
  const Electrical({Key? key}) : super(key: key);

  @override
  State<Electrical> createState() => _ElectricalState();
}

class _ElectricalState extends State<Electrical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 84, 85, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(164, 197, 134, 1.0),
        backgroundColor: const Color.fromRGBO(0, 43, 91, 1),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        // backgroundColor: const Color.fromRGBO(14, 41, 84, 1.0),
        title: Text(
          'Electrical Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(elecSem3Route);
                },
                child: Text(
                  'Semester 3',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(elecSem4Route);
                },
                child: Text(
                  'Semester 4',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(elecSem5Route);
                },
                child: Text(
                  'Semester 5',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(elecSem6Route);
                },
                child: Text(
                  'Semester 6',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(elecSem7Route);
                },
                child: Text(
                  'Semester 7',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(elecSem8Route);
                },
                child: Text(
                  'Semester 8',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//                                          CIVIL

class Civil extends StatefulWidget {
  const Civil({Key? key}) : super(key: key);

  @override
  State<Civil> createState() => _CivilState();
}

class _CivilState extends State<Civil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 84, 85, 1),
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(164, 197, 134, 1.0),
        backgroundColor: const Color.fromRGBO(0, 43, 91, 1),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        // backgroundColor: const Color.fromRGBO(14, 41, 84, 1.0),
        title: Text(
          'Civil Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(civilSem3Route);
                },
                child: Text(
                  'Semester 3',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(civilSem4Route);
                },
                child: Text(
                  'Semester 4',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(civilSem5Route);
                },
                child: Text(
                  'Semester 5',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(civilSem6Route);
                },
                child: Text(
                  'Semester 6',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(civilSem7Route);
                },
                child: Text(
                  'Semester 7',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 213, 213),
                  borderRadius: BorderRadius.circular(50)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(civilSem8Route);
                },
                child: Text(
                  'Semester 8',
                  style: GoogleFonts.novaOval(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
