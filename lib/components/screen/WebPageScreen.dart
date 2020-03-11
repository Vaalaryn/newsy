import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';

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
//            IconButton(
//              icon: Icon( !this._data.push ? Icons.alarm_add : Icons.alarm_on,
//                  color: !this._data.push
//                      ? Theme.of(context).textTheme.body1.color
//                      : Theme.of(context).primaryColor),
//              onPressed: () {
//                setState(() {
//                  this._data.push = !this._data.push;
//                });
//              },
//            ),
            IconButton(
              icon: Icon(!this._data.fav ? Icons.star_border : Icons.star,
                  color: !this._data.fav
                      ? Theme.of(context).textTheme.body1.color
                      : Theme.of(context).primaryColor),
              onPressed: () {
                setState(() {
                  this._data.fav = !this._data.fav;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.share, color: Theme.of(context).primaryColor),
              onPressed: () {
                final RenderBox box = context.findRenderObject();
                Share.share(
                    this._data.data_.url,
                    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
                );
              },
            )]),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: this._data.data_.url))
          ]));
  }
}
