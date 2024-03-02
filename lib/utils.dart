import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> signInUserAnon() async {
  try {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    // ignore: avoid_print
    print("Signed in with temporary account. UID: ${userCredential.user?.uid}");
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

Future<void> saveDataToFirebase(File? file, String? text) async {
  final storageRef = FirebaseStorage.instance.ref();

  try {
    if (file != null) {
      var fileName = file.path.split("/").last;
      Reference? imagesRef = storageRef.child("images/$fileName");
      await imagesRef.putFile(file);
    }
    if (text != null) {
      Reference? textRef = storageRef.child("text/");
      await textRef.putString(text);
    }

    if (file == null || text == null) {
      // selectedWidgets.add(const TextThing());
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}
