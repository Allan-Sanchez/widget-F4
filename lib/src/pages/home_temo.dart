import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final listComponent = ['one', 'two', 'three', 'four'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Page'),
      ),
      body: ListView(
        // children: _createList(),
        children: _createListMap(),
      ),
    );
  }

  // List<Widget> _createList() {
  //   List<Widget> newList = [];
  //   for (String component in listComponent) {
  //     final tempWidget = new ListTile(title: Text(component));
  //     newList
  //       ..add(tempWidget)
  //       ..add(Divider(
  //         color: Colors.greenAccent[400],
  //       ));
  //   }
  //   return newList;
  // }

  List<Widget> _createListMap() {
    return listComponent.map((item) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text(item),
            subtitle: Text('click to seee more.'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(
            color: Colors.blue[100],
          )
        ],
      );
    }).toList();
  }
}
