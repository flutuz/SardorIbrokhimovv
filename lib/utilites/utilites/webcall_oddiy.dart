import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebCallOddiy extends StatefulWidget {
  static const String id = 'web';

  const WebCallOddiy(
      {Key? key, this.cookieManager, required this.appbar, required this.url})
      : super(key: key);

  final CookieManager? cookieManager;
  final String appbar;
  final String url;

  @override
  State<WebCallOddiy> createState() => _WebCallOddiyState();
}

class _WebCallOddiyState extends State<WebCallOddiy> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  double progres = 0;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff0C8744),
        title: Text(widget.appbar),
        centerTitle: true,
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            minHeight: 3,
            value: progres,
            color: Color(0xff0C8744),
            backgroundColor: Colors.red,
          ),
          Expanded(
            child: WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              gestureNavigationEnabled: true,
              backgroundColor: const Color(0x00000000),
              onProgress: (progres) => setState(
                () {
                  this.progres = progres / 100;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
