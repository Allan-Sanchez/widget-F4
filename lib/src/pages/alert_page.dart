import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAlert(context),
          child: Text('Show Alert'),
          style: ElevatedButton.styleFrom(shape: StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_outlined),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Title alert'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('This is the content of the box of the alert'),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlutterLogo(
                    size: 100.0,
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('cancel')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('ok')),
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10.0)),
            ));
  }
}
