import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prototype_assignment/utils.dart';

File? _file;
String? _text;
XFile? img;
String? theData;

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          TextField(
              onChanged: (value) => {_text = value, theData = value},
              cursorColor: const Color.fromRGBO(195, 253, 187, 1),
              maxLength: 50),
          const Padding(padding: EdgeInsets.all(20))
        ],
      ),
    );
  }
}

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  ImageWidgetState createState() => ImageWidgetState();
}

class ImageWidgetState extends State<ImageWidget> {
  XFile? _imageFile;
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(pickedFile!.path);
      _imageFile = pickedFile;
      img = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: _imageFile != null
          ? Image.file(File(_imageFile!.path),
              filterQuality: FilterQuality.none)
          : Column(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(217, 251, 210, 1),
                      foregroundColor: const Color.fromARGB(255, 81, 81, 81),
                      side: const BorderSide(
                          width: 1, color: Color.fromARGB(255, 81, 81, 81))),
                  onPressed: _pickImage,
                  child: const Text('Select Image',
                      style: TextStyle(fontSize: 15)),
                ),
                const Padding(padding: EdgeInsets.all(20))
              ],
            ),
    );
  }
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(196, 253, 186, 1),
          shape: const BeveledRectangleBorder(),
          side: const BorderSide(width: 1),
          foregroundColor: Colors.black),
      onPressed: () {
        saveDataToFirebase(_file, _text);
        SnackBar sB = const SnackBar(
          content: Text(
            'Successfully Saved',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Color.fromRGBO(195, 253, 187, 0.5),
        );
        SnackBar sB2 = const SnackBar(
          content: Text(
            'Add at-least a widget or some data to save',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Color.fromRGBO(195, 253, 187, 0.5),
        );
        if (img != null || _text != null) {
          ScaffoldMessenger.of(context).showSnackBar(sB);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(sB2);
        }
      },
      child: const Text(
        "Save",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class TextThing extends StatefulWidget {
  const TextThing({super.key});

  @override
  State<TextThing> createState() => _TextThingState();
}

class _TextThingState extends State<TextThing> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Add at-least a widget to save',
        style: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }
}
