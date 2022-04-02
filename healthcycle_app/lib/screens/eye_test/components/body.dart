import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebPage(),
    );
  }
}

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://images.squarespace-cdn.com/content/v1/5e4c2ab855f49e2eb34dd11c/1586273214312-BT0OLPPTBG8C4O2TMRDJ/Safe+Eyes+America+Eye+Chart-2.jpg?format=1000w');
  }
}
