import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/app-place';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace(BuildContext context) {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Error'),
          content: Text('You didnt pick an image'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  SizedBox(height: 10),
                  ImageInput(_selectImage),
                ],
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            onPressed: () => _savePlace(context),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
