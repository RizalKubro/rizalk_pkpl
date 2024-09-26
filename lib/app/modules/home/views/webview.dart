import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({Key? key, }) : super(key : key);

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {

  final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse('https://www.instagram.com/rizalkubro/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212325),
        title: Text('Profil Instagram'),
      ),
      body:WebViewWidget(controller: controller),
    );
  }
  }
