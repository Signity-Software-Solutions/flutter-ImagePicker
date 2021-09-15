# Flutter image picker with Image Cropper

In this Flutter Application, we will develop an application that picks an image from Camera or Gallery and After that, it crop's it for fit in a circular image widget.

## Getting Started

Lets start its implementation with the following steps.

# **Creating a new Project**
1. Create a new project from File ⇒ New Flutter Project with your development IDE.
2. For pick image from gallery and camera, we have used image_picker: ^0.8.3+1 and for crop selected we have used image_cropper: ^1.4.1. As you can see, we have declared it in pubspec.yaml file.

**Pls see the below implementation:**

```dart
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  image_cropper: ^1.4.1
  image_picker: ^0.8.3+1
```
now, open the main.dart and see the below implementation:

```dart
ImagePickerHandler imagePicker;

@override
  void initState() {
    super.initState();
    imagePicker = new ImagePickerHandler(this);
    imagePicker.init();
  }
```
now, extent your widget state with ImagePickerListener, see below:
```dart
class _MyHomePageState extends State<MyHomePage> with ImagePickerListener{

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
}
```

which will overrid the selectedProfileImage method, you will get the final image in this method. 
**Pls see the below demo video.**

[Demo Video](https://www.youtube.com/watch?v=YCd1vFkN0F8 "Demo Video")

You can download the full source and you run the app. you can see the app running very smoothly as shown in the video demo.
But if you facing any problem. You can rasie the issue.



