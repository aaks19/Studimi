import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

//            Semester 1

class Sem1 extends StatefulWidget {
  const Sem1({Key? key}) : super(key: key);

  @override
  State<Sem1> createState() => _Sem1State();
}

class _Sem1State extends State<Sem1> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/First Year/1 Sem').listAll();
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
        title: Text(
          'First Year',
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
                  title: Container(
                    margin: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(248, 255, 255, 0.8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(249, 240, 230, 0.898),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        file.name,
                        style: GoogleFonts.acme(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  subtitle: progress != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              color: Colors.black,
                            ),
                          ),
                        )
                      : null,
                  trailing: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(248, 255, 255, 0.8),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(249, 240, 230, 0.898),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ]),
                    child: IconButton(
                      icon: const Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                      onPressed: () => downloadFile(index, file),
                    ),
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

//            Semester 2

class Sem2 extends StatefulWidget {
  const Sem2({Key? key}) : super(key: key);

  @override
  State<Sem2> createState() => _Sem2State();
}

class _Sem2State extends State<Sem2> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/First Year/2 Sem').listAll();
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
        title: Text(
          'First Year',
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
                  title: Container(
                    margin: const EdgeInsets.only(top: 25),
                    // height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(248, 255, 255, 0.8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(249, 240, 230, 0.898),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        file.name,
                        style: GoogleFonts.acme(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                  subtitle: progress != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              color: Colors.black,
                            ),
                          ),
                        )
                      : null,
                  trailing: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(248, 255, 255, 0.8),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(249, 240, 230, 0.898),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ]),
                    child: IconButton(
                      icon: const Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                      onPressed: () => downloadFile(index, file),
                    ),
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
