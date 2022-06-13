import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:namozni_organaman/utilites/utilites/webcall_oddiy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebCall extends StatefulWidget {
  static const String id = 'webcall';

  const WebCall(
      {Key? key,
      this.cookieManager,
      required this.urlIndex,
      required this.pageTitle})
      : super(key: key);
  final CookieManager? cookieManager;
  final int urlIndex;
  final String pageTitle;

  @override
  State<WebCall> createState() => _WebCallState();
}

class _WebCallState extends State<WebCall> {
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
        title: Text(
          widget.pageTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text("Manba"),
                      backgroundColor: Color(0xff0C8744),
                    ),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              '''   "Qur'oni Karim" bo'limidagi barcha materiallar www.islom.uz saytidan olindi ! ''',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebCallOddiy(
                                    appbar: "ISLOM.UZ",
                                    url: "https://islom.uz/"),
                              ),
                            ),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12.withOpacity(0.2),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff0C8744),
                              ),
                              margin:
                                  EdgeInsets.only(left: 60, right: 60, top: 20),
                              child: Center(
                                child: Text(
                                  "Saytga o'tish",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          ),
        ],
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
              initialUrl:
                  'https://islom.uz/mano_tarjima/${widget.urlIndex + 1}',
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
