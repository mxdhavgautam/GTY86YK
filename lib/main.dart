import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype_assignment/utils.dart';
import 'pages/homescreen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await signInUserAnon();
  SystemUiMode.immersiveSticky;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prototype Assignment',
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
        //colorScheme: ColorScheme.fromSeed(
        //seedColor: const Color.fromRGBO(241, 255, 237, 1),
        //),
      ),
      home: const HomeScreen(),
    );
  }
}
