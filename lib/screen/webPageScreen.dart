import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final data;

  WebViewContainer(this.data);

  @override
  createState() => _WebViewContainerState(this.data);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _data;
  final _key = UniqueKey();

  _WebViewContainerState(this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.alarm_add, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.star_border, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.share, color: Colors.black),
              onPressed: () {},
            )]),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: this._data.url))
          ]));
  }
}
