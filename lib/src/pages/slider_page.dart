import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorDefault = 200.0;
  bool _checkBoxDefault = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Slider'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 70.0),
          color: Colors.greenAccent[50],
          child: Column(
            children: [
              _createSlider(),
              _createCheckBox(),
              _createSwitch(),
              _imageSlider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        value: _valorDefault,
        min: 10.0,
        max: 500.0,
        divisions: 20,
        label: "Image size: $_valorDefault",
        activeColor: Colors.purple[700],
        onChanged: (_checkBoxDefault)
            ? null
            : (value) {
                setState(() {
                  _valorDefault = value;
                });
              });
  }

  Widget _createCheckBox() {
    // only check
    // return Checkbox(
    //     value: _checkBoxDefault,
    //     onChanged: (value) {
    //       setState(() {
    //         _checkBoxDefault = value;
    //       });
    //     });
    //
    return CheckboxListTile(
        title: Text('Enable Slider'),
        value: _checkBoxDefault,
        onChanged: (value) {
          setState(() {
            _checkBoxDefault = value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Enable Slider'),
        value: _checkBoxDefault,
        onChanged: (value) {
          setState(() {
            _checkBoxDefault = value;
          });
        });
  }

  Widget _imageSlider() {
    return Expanded(
      child: Image(
          fit: BoxFit.contain,
          width: _valorDefault,
          image: NetworkImage(
              'https://d3b4rd8qvu76va.cloudfront.net/991/866/495/1280003031-1ql47qj-ij501fart3df9lk/original/marge_simpson_by_swave18d4htg19.jpg')),
    );
  }
}
