import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'img_picker/image_picker_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Cropper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ImagePickerListener{

  ImagePickerHandler imagePicker;
  File _selectedProfileImg;

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePickerHandler(this);
    imagePicker.init();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Cropper"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click on button to select Image',
            ),
            _selectedProfileImg == null
                ? showImgPlaceholderView()
                : showUserImgView() ,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '',
        child: Icon(Icons.image),
      ),
    );
  }

  void _pickImage() {
    imagePicker.showDialog(context);
  }

  @override
  selectedProfileImage(XFile _image) {
    if(_image == null){
      //AppUtils.showToast("Invalid Image!", true);
      print("Invalid Image!");
      return;
    }
    _selectedProfileImg = File(_image.path);
    setState(() {
    });
  }

  showImgPlaceholderView() {
    return Container(
      margin: EdgeInsets.only(left: 20,top: 20,bottom: 20),
      width: 80,
      height:80,
      child: Icon(Icons.person_outline,color: Colors.grey, size: 40,),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightBlue,
            width: 4,
          ),
          shape: BoxShape.circle,
          color: Colors.white
      ),
    );
  }

  showUserImgView() {
    return Container(
        margin: EdgeInsets.only(left: 20,top: 20),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.lightBlue,
              width: 4,
            ),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(50)
        ),
        width: 100,height: 100,
        child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.all(Radius.circular(80)),
            child: Image.file(_selectedProfileImg,width: 100,height: 100,fit: BoxFit.cover,)
        )
    );
  }
}
