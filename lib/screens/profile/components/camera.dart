// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
//
// class ImageCapture extends StatefulWidget {
//   @override
//   _ImageCaptureState createState() => _ImageCaptureState();
// }
//
// class _ImageCaptureState extends State<ImageCapture> {
//   // C:\Users\User\AndroidStudioProjects\ecommerce_ui\assets\images
//   File? _imageFile;
//
//   Future<void> _captureImage(ImageSource source) async {
//     try {
//       final pickedFile = await ImagePicker().getImage(
//         source: source,
//         maxWidth: 800,
//       );
//       setState(() {
//         _imageFile = File(pickedFile!.path);
//       });
//       // Save the image locally
//       final directory = await getApplicationDocumentsDirectory();
//       final imagePath = '${directory.path}/my_image.jpg';
//       await _imageFile!.copy(imagePath);
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Capture'),
//       ),
//       body: Center(
//         child: _imageFile == null
//             ? Text('No image selected.')
//             : Image.file(_imageFile!),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Show an alert dialog with two options
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Choose an option'),
//                 actions: [
//                   TextButton(
//                     child: Text('Camera'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                       _captureImage(ImageSource.camera);
//                     },
//                   ),
//                   TextButton(
//                     child: Text('Gallery'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                       _captureImage(ImageSource.gallery);
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }
