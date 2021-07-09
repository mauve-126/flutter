import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';


class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {

  final ImagePicker _picker = ImagePicker(); // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)
  PickedFile? _imageFile = null; // 카메라/갤러리에서 사진 가져올 때 사용함 (image_picker)
  // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        // decoration: BoxDecoration(
        //   color : Colors.blue,
        // ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: <Widget>[
            imageProfile(),
            SizedBox(height: 20),
            nameTextField(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


  Widget imageProfile() {
    //return ColorFiltered(
    //colorFilter: ColorFilter.mode(Colors.blueAccent.withOpacity(0.4), BlendMode.srcOver),
    return Center(
      child: Stack(
        children: <Widget>[
          // Image.asset(
          //   _imageFile == null? 'assets/ocean.jpeg' : _imageFile!.path,
          //   height: 200,
          //   fit: BoxFit.fitHeight,
          //   color : Colors.limeAccent,
          //   colorBlendMode: BlendMode.dstATop,
          // ),
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.limeAccent,
            //backgroundImage: FileImage(File(_imageFile.path)) as ImageProvider,
            backgroundImage: _imageFile == null ? AssetImage(
                'assets/ocean.jpeg') :
            FileImage(File(_imageFile!.path)) as ImageProvider,
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomSheet()));
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black87,
                  size: 40,
                ),
              )
          )
        ],
      ),
    );
  }


  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black87,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black87,
          ),
          labelText: 'Name',
          hintText: 'Input your name'
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      //colorFilter: ColorFilter.mode(Colors.greenAccent, BlendMode.hue),
        height: 100,
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Choose Profile photo',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera, size: 50,),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                    print("camera");
                  },
                  label: Text('Camera', style: TextStyle(fontSize: 20),),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.photo_library, size: 50,),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text('Gallery', style: TextStyle(fontSize: 20),),
                )
              ],
            )
          ],
        )
    );
  }

  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
    });
    final bytes = File(pickedFile!.path).readAsBytesSync();

    String img64 = base64Encode(bytes);
    print(img64);
  }
}

