import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Item extends StatefulWidget {
  const Item({
    super.key,
    required this.listoflink,
    required this.heading,
    required this.uris,
  });
  final String heading;
  final List<String> listoflink;
  final List<Uri> uris;

  @override
  // ignore: library_private_types_in_public_api
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  // ignore: unused_field
  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not Show Pdf $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xff2A4A9F),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.heading,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )),
      ListView.separated(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => TextButton(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.listoflink[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(widget.uris[index]);
                }),
              ),
          separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Color(0xff2A4A9F),
                indent: 10,
                endIndent: 10,
              ),
          itemCount: widget.listoflink.length)
    ]);
  }
}
