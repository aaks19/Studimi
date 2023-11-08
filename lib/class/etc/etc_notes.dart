import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';


//            EtcSemester 3

class EtcSem3 extends StatefulWidget {
  const EtcSem3({Key? key}) : super(key: key);

  @override
  State<EtcSem3> createState() => _EtcSem3State();
}

class _EtcSem3State extends State<EtcSem3> {
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
          'Electronics & Telecommunication',
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

//            EtcSemester 4

class EtcSem4 extends StatefulWidget {
  const EtcSem4({Key? key}) : super(key: key);

  @override
  State<EtcSem4> createState() => _EtcSem4State();
}

class _EtcSem4State extends State<EtcSem4> {
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
          'Electronics & Telecommunication',
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

//            EtcSemester 5

class EtcSem5 extends StatefulWidget {
  const EtcSem5({Key? key}) : super(key: key);

  @override
  State<EtcSem5> createState() => _EtcSem5State();
}

class _EtcSem5State extends State<EtcSem5> {
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
          'Electronics & Telecommunication',
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

//            EtcSemester 6

class EtcSem6 extends StatefulWidget {
  const EtcSem6({Key? key}) : super(key: key);

  @override
  State<EtcSem6> createState() => _EtcSem6State();
}

class _EtcSem6State extends State<EtcSem6> {
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
          'Electronics & Telecommunication',
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

//            EtcSemester 7

class EtcSem7 extends StatefulWidget {
  const EtcSem7({Key? key}) : super(key: key);

  @override
  State<EtcSem7> createState() => _EtcSem7State();
}

class _EtcSem7State extends State<EtcSem7> {
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
          'Electronics & Telecommunication',
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

//            EtcSemester 8

class EtcSem8 extends StatefulWidget {
  const EtcSem8({Key? key}) : super(key: key);

  @override
  State<EtcSem8> createState() => _EtcSem8State();
}

class _EtcSem8State extends State<EtcSem8> {
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
          'Electronics & Telecommunication',
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
