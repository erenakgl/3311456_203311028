import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WebPage();
  }
}

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://images.squarespace-cdn.com/content/v1/5e4c2ab855f49e2eb34dd11c/1586273214312-BT0OLPPTBG8C4O2TMRDJ/Safe+Eyes+America+Eye+Chart-2.jpg?format=1000w');
  }
}
