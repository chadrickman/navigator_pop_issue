import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExampleWebView extends StatefulWidget {
  // The issue is that we set a return value for the webview.
  // Determined that it doesn't matter if the webview returns anything or not.
  // Changing this to void it'll work as expected.
  static Route<String> route() {
    return MaterialPageRoute(builder: (context) {
      return ExampleWebView();
    });
  }

  @override
  _ExampleWebViewState createState() => _ExampleWebViewState();
}

class _ExampleWebViewState extends State<ExampleWebView> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Look a website!'),
      ),
      body: WebView(
        initialUrl: 'https://pub.dev',
        javascriptMode: JavascriptMode.unrestricted,
        debuggingEnabled: true,
      ),
    );
  }
}
