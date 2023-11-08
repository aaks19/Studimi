import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';



//            CESemester 3

class CESem3 extends StatefulWidget {
  const CESem3({Key? key}) : super(key: key);

  @override
  State<CESem3> createState() => _CESem3State();
}

class _CESem3State extends State<CESem3> {
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
          'Civil Engineering',
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

//            CESemester 4

class CESem4 extends StatefulWidget {
  const CESem4({Key? key}) : super(key: key);

  @override
  State<CESem4> createState() => _CESem4State();
}

class _CESem4State extends State<CESem4> {
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
          'Civil Engineering',
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

//            CESemester 5

class CESem5 extends StatefulWidget {
  const CESem5({Key? key}) : super(key: key);

  @override
  State<CESem5> createState() => _CESem5State();
}

class _CESem5State extends State<CESem5> {
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
          'Civil Engineering',
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

//            CESemester 6

class CESem6 extends StatefulWidget {
  const CESem6({Key? key}) : super(key: key);

  @override
  State<CESem6> createState() => _CESem6State();
}

class _CESem6State extends State<CESem6> {
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
          'Civil Engineering',
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

//            CESemester 7

class CESem7 extends StatefulWidget {
  const CESem7({Key? key}) : super(key: key);

  @override
  State<CESem7> createState() => _CESem7State();
}

class _CESem7State extends State<CESem7> {
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
          'Civil Engineering',
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

//            CESemester 8

class CESem8 extends StatefulWidget {
  const CESem8({Key? key}) : super(key: key);

  @override
  State<CESem8> createState() => _CESem8State();
}

class _CESem8State extends State<CESem8> {
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
          'Civil Engineering',
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
