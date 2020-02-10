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
          backgroundColor: Theme.of(context).backgroundColor,
          iconTheme: IconThemeData(color: Theme.of(context).textTheme.body1.color),
          bottom: PreferredSize(child: Container(color:  Theme.of(context).primaryColor, height: 4.0,), preferredSize: Size.fromHeight(4.0)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.alarm_add, color: Theme.of(context).textTheme.body1.color),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.star_border, color: Theme.of(context).textTheme.body1.color),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.share, color: Theme.of(context).primaryColor),
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
