import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newboat/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  

// ...
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boat',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
        ),
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.blue.shade600),
        useMaterial3: true,
      ),
      home: const Home()
    );
  }
}


