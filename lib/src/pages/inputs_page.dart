import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = '';
  String _email = '';
  String _optionSelected = 'Banana';

  List _fruts = ['Banana', 'Apple', 'Pineapple', 'Mango', 'Peach'];

  TextEditingController _inputFieldDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inputs Form'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
          children: [
            _createInput(),
            Divider(),
            _createInputEmail(),
            Divider(),
            _createInputPassword(),
            Divider(),
            _createDatePicker(context),
            Divider(),
            _createSelect(),
            Divider(),
            _listInputData(),
          ],
        ),
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Caracters ${_name.length}'),
          hintText: 'Type your name',
          labelText: 'Name',
          helperText: 'help?',
          icon: Icon(
            Icons.account_circle,
            size: 40.0,
          ),
          suffixIcon: Icon(Icons.accessibility_new)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Caracters ${_email.length}'),
          hintText: 'Type your email',
          labelText: 'Email',
          helperText: 'email?',
          icon: Icon(
            Icons.email,
            size: 40.0,
          ),
          suffixIcon: Icon(Icons.alternate_email)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createInputPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Caracters ${_email.length}'),
          hintText: 'Type your password',
          labelText: 'Password',
          helperText: 'password',
          icon: Icon(
            Icons.lock,
            size: 40.0,
          ),
          suffixIcon: Icon(Icons.lock_open)),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createDatePicker(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'date of birth',
          icon: Icon(
            Icons.perm_contact_calendar,
            size: 40.0,
          ),
          suffixIcon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  Widget _createSelect() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 50.0),
        DropdownButton(
          items: getOptionsDropdowm(),
          value: _optionSelected,
          onChanged: (value) {
            setState(() {
              _optionSelected = value;
            });
          },
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropdowm() {
    //using forEach
    List<DropdownMenuItem<String>> options = [];
    _fruts.forEach((item) {
      options.add(DropdownMenuItem(
        child: Text(item),
        value: item,
      ));
    });
    return options;

    //using map
    // return _fruts.map((item) {
    //   return DropdownMenuItem(
    //     child: Text(item),
    //     value: item,
    //   );
    // }).toList();
  }

  Widget _listInputData() {
    return ListTile(
      title: Text('The name is $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_optionSelected),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime(2025));

    if (picked != null) {
      setState(() {
        _inputFieldDateController.text = picked.toString();
      });
    }
  }
}
