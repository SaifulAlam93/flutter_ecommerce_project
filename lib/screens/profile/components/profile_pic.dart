import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _imageFile;

  Future<void> _captureImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
      );
      setState(() {
        _imageFile = File(pickedFile!.path);
      });
      // Save the image locally
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/my_image.jpg';
      await _imageFile!.copy(imagePath);
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            // backgroundImage: AssetImage("assets/images/Profile Image.png"),
      backgroundImage:  _imageFile == null
                ? AssetImage("assets/images/Profile Image.png")
                : Image.file(_imageFile!).image,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () async{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Choose an option'),
                        actions: [
                          TextButton(
                            child: Text('Camera'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              _captureImage(ImageSource.camera);
                            },
                          ),
                          TextButton(
                            child: Text('Gallery'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              _captureImage(ImageSource.gallery);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
