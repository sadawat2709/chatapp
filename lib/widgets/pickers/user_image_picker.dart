import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);
  final void Function(File pickedImage) imagePickFn;
  
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  void _pickImage() async
  {
  final pickedImageFile=await ImagePicker.pickImage(
    maxWidth: 150,
    imageQuality: 50,
    source: ImageSource.camera);
  setState(() {
    _pickedImage=pickedImageFile;
  });
  widget.imagePickFn(pickedImageFile);
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CircleAvatar(radius:40,
      backgroundColor: Colors.grey,
      backgroundImage: _pickedImage !=null?FileImage(_pickedImage):null),
                  FlatButton.icon(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _pickImage,
                     icon: Icon(Icons.image),
                      label:Text("Add Image")),
    ],
      
    );
  }
}