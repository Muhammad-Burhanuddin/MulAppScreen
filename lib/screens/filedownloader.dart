import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:file_utils/file_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

class FileDownloader extends StatefulWidget {
  const FileDownloader({super.key});

  @override
  _FileDownloaderState createState() => _FileDownloaderState();
}

class _FileDownloaderState extends State<FileDownloader> {
  final pdfUrl =
      "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";

  var progress = "";
  var path = "No Data";
  var platformVersion = "Unknown";
  late Directory externalDir;

  String convertCurrentDateTimeToString() {
    String formattedDateTime =
        DateFormat('yyyyMMdd_kkmmss').format(DateTime.now()).toString();
    return formattedDateTime;
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    final status = await Permission.storage.request();
    if (status.isGranted) {
      String path = "";
      if (Platform.isAndroid) {
        path = "/sdcard/download/";
      } else {
        path = (await getApplicationDocumentsDirectory()).path;
      }

      try {
        FileUtils.mkdir([path]);
        await dio
            .download(pdfUrl, "$path${convertCurrentDateTimeToString()}.pdf",
                onReceiveProgress: (receivedBytes, totalBytes) {
          setState(() {
            progress =
                "${((receivedBytes / totalBytes) * 100).toStringAsFixed(0)}%";
            print(progress);
          });
        });
      } catch (e) {
        print(e);
      }

      setState(() {
        progress = "Download Completed.";
        path = "$path${convertCurrentDateTimeToString()}.pdf";
      });
      print(path);
      print('here give alert-->completed');
    } else {
      setState(() {
        progress = "Permission Denied!";
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('File Downloader'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              downloadFile();
            },
            child: Text('Download pdf')),
      ));
}
