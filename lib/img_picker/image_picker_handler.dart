import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'image_picker_dialog.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'preview_cropped_image_alert.dart';

class ImagePickerHandler {

  final ImagePicker _picker = ImagePicker();
  ImagePickerDialog imagePicker;
  ImagePickerListener _listener;
  BuildContext context;

  ImagePickerHandler(this._listener);

  openCamera() async {
    imagePicker.dismissDialog();
    var image = await _picker.pickImage(source: ImageSource.camera,imageQuality: 50);
    cropImage(image);
    //selectedImage(image);
  }

  openGallery() async {
    imagePicker.dismissDialog();
    var image = await await _picker.pickImage(source: ImageSource.gallery,imageQuality: 50);
    cropImage(image);
    //selectedImage(image);
  }

  void init() {
    imagePicker = new ImagePickerDialog(this);
    imagePicker.initState();
  }

  Future cropImage(XFile image) async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.lightBlue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
          title: 'Crop Image',
        )
    );
    //print("croppedFile=${croppedFile}");
    if(croppedFile != null){
      var result = await PreviewCroppedImageAlert.previewCroppedImageDialog(context, "Preview", croppedFile,
          "Cancel", "OK");
      //print("result=${result}");
      if(result){
        XFile xFile = new XFile(croppedFile.path);
        selectedImage(xFile);
      }
    }
  }

  Future selectedImage(XFile image) async {
    _listener.selectedProfileImage(image);
  }

  showDialog(BuildContext context) {
    this.context = context;
    imagePicker.getImage(context);
  }
  closeDialog(){
    imagePicker.dismissDialog();
  }


}


abstract class ImagePickerListener {
  selectedProfileImage(XFile _image);
}


