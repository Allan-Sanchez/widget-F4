import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _listDefault = [];
  int _lastItem = 0;
  bool _showLoading = false;

  ScrollController _myScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _add10Images();

    _myScrollController.addListener(() {
      final _endScroll = _myScrollController.position.maxScrollExtent;
      if (_myScrollController.position.pixels == _endScroll) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _myScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('List page')),
          body: Stack(
            children: [_createList(), _createLoading()],
          )),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getFirstImage,
      child: ListView.builder(
        controller: _myScrollController,
        itemCount: _listDefault.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listDefault[index] + 1;
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300?random=$imagen'));
        },
      ),
    );
  }

  void _add10Images() {
    for (var i = 1; i < 10; i++) {
      _lastItem++;
      _listDefault.add(_lastItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _showLoading = true;
    setState(() {});
    final duration = Duration(seconds: 2);
    new Timer(duration, responseHttp);
  }

  void responseHttp() {
    _showLoading = false;
    _myScrollController.animateTo(_myScrollController.position.pixels + 150,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _add10Images();
  }

  Widget _createLoading() {
    if (_showLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 30.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> _getFirstImage() {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listDefault.clear();
      _lastItem++;
      _add10Images();
    });
    return Future.delayed(duration);
  }
}
