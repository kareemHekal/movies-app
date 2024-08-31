import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';
import 'navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: app_colors.black,
            selectedItemColor: app_colors.yellow, // Set the color of the selected item
            unselectedItemColor: app_colors.white, // Set the color of the unselected items
          ),
        textTheme: TextTheme(bodyMedium: TextStyle(
          color:app_colors.white
        )),
        useMaterial3: true,
      ),
      initialRoute:'/HomeScreen',
      routes: {
        '/HomeScreen': (context) =>  Home_page(),
      },
    );
  }
}


