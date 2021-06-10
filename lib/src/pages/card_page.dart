import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Page1')),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cardType2(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            title: Text('Thi is my fist post'),
            leading: Icon(Icons.photo_album),
            subtitle: Text(
                'lorem is tristique ansolution sky orbit process essential office water stranger smaller town fought four ranch story outline rubber team tribe younger care wolf bark whole library'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Save'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Delete'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final myCard = Container(
      color: Colors.white,
      child: Column(
        children: [
          FadeInImage(
              height: 400,
              fit: BoxFit.cover,
              // fadeInDuration: Duration(milliseconds: 200),
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80')),
          // Image(
          //     image: NetworkImage(
          //         'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80')),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("Title here"),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                spreadRadius: 1.0,
                offset: Offset(2.0, 5.0))
          ]),
      // color: Colors.red,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: myCard,
      ),
    );
  }
}
