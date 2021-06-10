import 'package:flutter/material.dart';
//utilitis
import 'package:components/src/provider/menu_provide.dart';
import 'package:components/src/utils/icon_string_util.dart';
//router
// import 'package:components/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Principal Menu'),
        ),
        body: _listWidget(),
      ),
    );
  }

  Widget _listWidget() {
    return FutureBuilder(
      future: menuProvider.dataLoading(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(context, snapshot.data),
        );
      },
    );
    // return ListView(
    //   children: _listItems(),
    // );
  }

// list with for method
  // List<Widget> _listItems(List<dynamic> data) {
  //   final List<Widget> handleList = [];
  //   data.forEach((item) {
  //     final widgetTemp = ListTile(
  //       leading: getIcon(item['icon']),
  //       title: Text(item['texto']),
  //       trailing: Icon(
  //         Icons.keyboard_arrow_right,
  //         color: Colors.blue[400],
  //       ),
  //       onTap: () {},
  //     );
  //     handleList
  //       ..add(widgetTemp)
  //       ..add(Divider(
  //         color: Colors.blue[400],
  //       ));
  //   });
  //   return handleList;
  // }

//practicando con la funcion map
  List<Widget> _listItems(BuildContext context, List<dynamic> data) {
    return data.map((item) {
      return Column(
        children: [
          ListTile(
            leading: getIcon(item['icon']),
            title: Text(item['texto']),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blue[400],
            ),
            onTap: () {
              // final route =
              //     MaterialPageRoute(builder: (context) => AlertPage());
              // Navigator.push(context, route);
              // router with name
              Navigator.pushNamed(context, item['ruta']);
            },
          ),
          Divider(
            color: Colors.blueAccent[200],
          )
        ],
      );
    }).toList();
  }
}
