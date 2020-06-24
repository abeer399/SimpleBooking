import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String selectedUrl;
  WebViewPage({
    Key key,
    @required this.title,
    @required this.selectedUrl,
  }) : super(key: key);

  @override
  _WebViewState createState() =>
      _WebViewState(title: title, selectedUrl: selectedUrl);
}

class _WebViewState extends State<WebViewPage> {
  final FirebaseMessaging _messaging = FirebaseMessaging();

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  final String title;
  final String selectedUrl;
  _WebViewState({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();

    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {});

    _onStateChanged = flutterWebviewPlugin.onStateChanged
        .listen((WebViewStateChanged state) {});

    // Add a listener to on url changed
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          if (url.startsWith("https://thesunemporium.simplybook.me/v2/#book")) {
            RegExp regExp = new RegExp("status=(.*)");
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: WebviewScaffold(
        withJavascript: true,
        url: selectedUrl,

        withZoom: false,
        withLocalStorage: true,
        hidden: true,
      ),
    );
  }
}
