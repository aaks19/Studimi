import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

//            CseSemester 3

class CseSem3 extends StatefulWidget {
  const CseSem3({Key? key}) : super(key: key);

  @override
  State<CseSem3> createState() => _CseSem3State();
}

class _CseSem3State extends State<CseSem3> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/CSE/3sem').listAll();
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
          'Computer Science & Engineering',
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

//            CseSemester 4

class CseSem4 extends StatefulWidget {
  const CseSem4({Key? key}) : super(key: key);

  @override
  State<CseSem4> createState() => _CseSem4State();
}

class _CseSem4State extends State<CseSem4> {
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
          'Computer Science & Engineering',
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

//            CseSemester 5

class CseSem5 extends StatefulWidget {
  const CseSem5({Key? key}) : super(key: key);

  @override
  State<CseSem5> createState() => _CseSem5State();
}

class _CseSem5State extends State<CseSem5> {
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
          'Computer Science & Engineering',
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

//            CseSemester 6

class CseSem6 extends StatefulWidget {
  const CseSem6({Key? key}) : super(key: key);

  @override
  State<CseSem6> createState() => _CseSem6State();
}

class _CseSem6State extends State<CseSem6> {
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
          'Computer Science & Engineering',
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

//            CseSemester 7

class CseSem7 extends StatefulWidget {
  const CseSem7({Key? key}) : super(key: key);

  @override
  State<CseSem7> createState() => _CseSem7State();
}

class _CseSem7State extends State<CseSem7> {
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
          'Computer Science & Engineering',
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

//            CseSemester 8

class CseSem8 extends StatefulWidget {
  const CseSem8({Key? key}) : super(key: key);

  @override
  State<CseSem8> createState() => _CseSem8State();
}

class _CseSem8State extends State<CseSem8> {
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
          'Computer Science & Engineering',
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
