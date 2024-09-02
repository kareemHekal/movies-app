import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';
import 'navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error initializing Firebase');
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: app_colors.black,
                selectedItemColor: app_colors.yellow,
                unselectedItemColor: app_colors.white,
              ),
              textTheme: TextTheme(bodyMedium: TextStyle(color: app_colors.white)),
              useMaterial3: true,
            ),
            initialRoute:'/HomeScreen',
            routes: {
              '/HomeScreen': (context) =>  Home_page(),
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

