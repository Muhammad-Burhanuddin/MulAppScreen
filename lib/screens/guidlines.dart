import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GuildlinesScreen extends StatefulWidget {
  const GuildlinesScreen({super.key});

  @override
  State<GuildlinesScreen> createState() => _GuildlinesScreenState();
}

class _GuildlinesScreenState extends State<GuildlinesScreen> {
  Future<void> lunchurl(String url) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guidline')),
      body: Column(
        children: [
          TextButton(
              // ignore: deprecated_member_use
              onPressed: () async {},
              child: Text(
                  'Selection of Major Minor LA 3rd Semester-(Spring 2022)'))
        ],
      ),
    );
  }
}
