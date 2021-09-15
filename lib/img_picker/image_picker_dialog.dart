import 'package:flutter/material.dart';
import 'image_picker_handler.dart';

class ImagePickerDialog extends StatelessWidget {

  ImagePickerHandler _listener;
  BuildContext context;

  ImagePickerDialog(this._listener);

  ///any initialization for your app
  void initState() {

  }

  getImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  dismissDialog() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return dialogView();
  }

  Widget dialogView(){

    return Material(
        type: MaterialType.transparency,
        child: Opacity(
          opacity: 1.0,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                  decoration: BoxDecoration(
                      boxShadow: shadow,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        "Select Image",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff007AFF),),
                      ),
                      Text(
                        "From one of the options",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () => _listener.openCamera(),
                        child: Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: (){
                                  }, icon: Icon(Icons.camera_alt,color: Color(0xff007AFF),)
                              ),

                              Expanded(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Camera",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xff007AFF),),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 30,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () => _listener.openGallery(),
                        child: Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: (){
                                  }, icon: Icon(Icons.image,color:Color(0xff007AFF),)
                              ),

                              Expanded(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Gallery",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xff007AFF),),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 30,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    dismissDialog();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 0),
                    decoration: BoxDecoration(
                        boxShadow: shadow,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color(0xff007AFF)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
        )
    );
  }

  Widget roundedButton(
      String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(15.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(100.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 18.0, fontWeight: FontWeight.normal),
      ),
    );
    return loginBtn;
  }

  List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(
      color: Colors.black.withOpacity(0.16),
      blurRadius: 6.0,
      offset: Offset(0, 3),
    ),
  ];

}
