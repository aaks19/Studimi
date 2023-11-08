import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

//            MechSemester 3

class MechSem3 extends StatefulWidget {
  const MechSem3({Key? key}) : super(key: key);

  @override
  State<MechSem3> createState() => _MechSem3State();
}

class _MechSem3State extends State<MechSem3> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/MECH/3sem').listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 55, 91, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 25, 82, 1.0),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
       
        title: Text(
          'Mechanical Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;

            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                double? progress = downloadProgress[index];

                return ListTile(
                  title: Text(
                    file.name,
                    style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  subtitle: progress != null
                      ? Container(
                          height: 8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                            color: Colors.black,
                          ),
                        )
                      : null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                    onPressed: () => downloadFile(index, file),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An Error Ocurred'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future downloadFile(int index, Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';
    await Dio().download(url, path,
        onReceiveProgress: (receivedBytes, totalBytes) {
      double progress = receivedBytes / totalBytes;

      setState(() {
        downloadProgress[index] = progress;
      });
    });

    if (url.contains('.pdf')) {
      launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }

//                TO OPEN PDF IN GOOGLE DRIVE WEB.
    // var googleDocsUrl =
    //     'https://docs.google.com/gview?embedded=true&url=${Uri.encodeQueryComponent(url)}';
    // final Uri uri = Uri.parse(googleDocsUrl);
    // launchUrl(uri);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Downloaded ${ref.name}'),
    ));
  }
}

//            MechSemester 4

class MechSem4 extends StatefulWidget {
  const MechSem4({Key? key}) : super(key: key);

  @override
  State<MechSem4> createState() => _MechSem4State();
}

class _MechSem4State extends State<MechSem4> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/MECH/4sem').listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 55, 91, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 25, 82, 1.0),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
       
        title: Text(
          'Mechanical Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;

            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                double? progress = downloadProgress[index];

                return ListTile(
                  title: Text(
                    file.name,
                    style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  subtitle: progress != null
                      ? Container(
                          height: 8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                            color: Colors.black,
                          ),
                        )
                      : null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                    onPressed: () => downloadFile(index, file),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An Error Ocurred'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future downloadFile(int index, Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';
    await Dio().download(url, path,
        onReceiveProgress: (receivedBytes, totalBytes) {
      double progress = receivedBytes / totalBytes;

      setState(() {
        downloadProgress[index] = progress;
      });
    });

    if (url.contains('.pdf')) {
      launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }

//                TO OPEN PDF IN GOOGLE DRIVE WEB.
    // var googleDocsUrl =
    //     'https://docs.google.com/gview?embedded=true&url=${Uri.encodeQueryComponent(url)}';
    // final Uri uri = Uri.parse(googleDocsUrl);
    // launchUrl(uri);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Downloaded ${ref.name}'),
    ));
  }
}

//            MechSemester 5

class MechSem5 extends StatefulWidget {
  const MechSem5({Key? key}) : super(key: key);

  @override
  State<MechSem5> createState() => _MechSem5State();
}

class _MechSem5State extends State<MechSem5> {
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
      backgroundColor: const Color.fromRGBO(28, 55, 91, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 25, 82, 1.0),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Mechanical Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;

            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                double? progress = downloadProgress[index];

                return ListTile(
                  title: Text(
                    file.name,
                    style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  subtitle: progress != null
                      ? Container(
                          height: 8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                            color: Colors.black,
                          ),
                        )
                      : null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                    onPressed: () => downloadFile(index, file),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An Error Ocurred'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future downloadFile(int index, Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';
    await Dio().download(url, path,
        onReceiveProgress: (receivedBytes, totalBytes) {
      double progress = receivedBytes / totalBytes;

      setState(() {
        downloadProgress[index] = progress;
      });
    });

    if (url.contains('.pdf')) {
      launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }

//                TO OPEN PDF IN GOOGLE DRIVE WEB.
    // var googleDocsUrl =
    //     'https://docs.google.com/gview?embedded=true&url=${Uri.encodeQueryComponent(url)}';
    // final Uri uri = Uri.parse(googleDocsUrl);
    // launchUrl(uri);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Downloaded ${ref.name}'),
    ));
  }
}

//            MechSemester 6

class MechSem6 extends StatefulWidget {
  const MechSem6({Key? key}) : super(key: key);

  @override
  State<MechSem6> createState() => _MechSem6State();
}

class _MechSem6State extends State<MechSem6> {
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
      backgroundColor: const Color.fromRGBO(28, 55, 91, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 25, 82, 1.0),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Mechanical Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;

            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                double? progress = downloadProgress[index];

                return ListTile(
                  title: Text(
                    file.name,
                    style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  subtitle: progress != null
                      ? Container(
                          height: 8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                            color: Colors.black,
                          ),
                        )
                      : null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                    onPressed: () => downloadFile(index, file),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An Error Ocurred'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future downloadFile(int index, Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';
    await Dio().download(url, path,
        onReceiveProgress: (receivedBytes, totalBytes) {
      double progress = receivedBytes / totalBytes;

      setState(() {
        downloadProgress[index] = progress;
      });
    });

    if (url.contains('.pdf')) {
      launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }

//                TO OPEN PDF IN GOOGLE DRIVE WEB.
    // var googleDocsUrl =
    //     'https://docs.google.com/gview?embedded=true&url=${Uri.encodeQueryComponent(url)}';
    // final Uri uri = Uri.parse(googleDocsUrl);
    // launchUrl(uri);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Downloaded ${ref.name}'),
    ));
  }
}

//            MechSemester 7

class MechSem7 extends StatefulWidget {
  const MechSem7({Key? key}) : super(key: key);

  @override
  State<MechSem7> createState() => _MechSem7State();
}

class _MechSem7State extends State<MechSem7> {
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
      backgroundColor: const Color.fromRGBO(28, 55, 91, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 25, 82, 1.0),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        
        title: Text(
          'Mechanical Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;

            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                double? progress = downloadProgress[index];

                return ListTile(
                  title: Text(
                    file.name,
                    style: GoogleFonts.acme(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  subtitle: progress != null
                      ? Container(
                          height: 8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                            color: Colors.black,
                          ),
                        )
                      : null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                    onPressed: () => downloadFile(index, file),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An Error Ocurred'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future downloadFile(int index, Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';
    await Dio().download(url, path,
        onReceiveProgress: (receivedBytes, totalBytes) {
      double progress = receivedBytes / totalBytes;

      setState(() {
        downloadProgress[index] = progress;
      });
    });

    if (url.contains('.pdf')) {
      launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }

//                TO OPEN PDF IN GOOGLE DRIVE WEB.
    // var googleDocsUrl =
    //     'https://docs.google.com/gview?embedded=true&url=${Uri.encodeQueryComponent(url)}';
    // final Uri uri = Uri.parse(googleDocsUrl);
    // launchUrl(uri);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Downloaded ${ref.name}'),
    ));
  }
}

//            MechSemester 8

class MechSem8 extends StatefulWidget {
  const MechSem8({Key? key}) : super(key: key);

  @override
  State<MechSem8> createState() => _MechSem8State();
}

class _MechSem8State extends State<MechSem8> {
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
      backgroundColor: const Color.fromRGBO(28, 55, 91, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 25, 82, 1.0),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        
        title: Text(
          'Mechanical Engineering',
          style: GoogleFonts.novaOval(
              textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
        ),
      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;

            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                double? progress = downloadProgress[index];

                return ListTile(
                  title: Text(file.name),
                  subtitle: progress != null
                      ? Container(
                          height: 8,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                            color: Colors.black,
                          ),
                        )
                      : null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                    onPressed: () => downloadFile(index, file),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An Error Ocurred'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future downloadFile(int index, Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';
    await Dio().download(url, path,
        onReceiveProgress: (receivedBytes, totalBytes) {
      double progress = receivedBytes / totalBytes;

      setState(() {
        downloadProgress[index] = progress;
      });
    });

    if (url.contains('.pdf')) {
      launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    }

//                TO OPEN PDF IN GOOGLE DRIVE WEB.
    // var googleDocsUrl =
    //     'https://docs.google.com/gview?embedded=true&url=${Uri.encodeQueryComponent(url)}';
    // final Uri uri = Uri.parse(googleDocsUrl);
    // launchUrl(uri);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Downloaded ${ref.name}'),
    ));
  }
}
