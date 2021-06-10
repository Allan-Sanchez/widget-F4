import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://indiehoy.com/wp-content/uploads/2021/03/homero-simpson.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.purple[400],
              child: Text('HS'),
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://cdn.alfabetajuega.com/wp-content/uploads/2019/10/homer-simpson-playa-780x405.jpg')),
        ),
      ),
    );
  }
}
