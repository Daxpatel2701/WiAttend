import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wifi_attendance_app/models%20&%20providers/user_data.dart';
import 'package:wifi_attendance_app/screens/faculty/faculty_home_screen.dart';
import 'package:wifi_attendance_app/screens/faculty/faculty_tabbar_screen.dart';
import 'package:wifi_attendance_app/screens/student/student_home_screen.dart';
import 'package:wifi_attendance_app/screens/login_screen.dart';
import 'package:wifi_attendance_app/screens/signup_screen.dart';
import 'package:wifi_attendance_app/screens/splash_screen.dart';
import 'package:wifi_attendance_app/screens/student/student_tabbar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Color.fromRGBO(14, 16, 33, 1),
            secondaryHeaderColor: Color.fromRGBO(105, 64, 210, 1),
            textTheme: TextTheme(
              bodyMedium:
                  GoogleFonts.poppins(fontSize: 15, color: Colors.white),
              bodySmall: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
            )),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          StudentTabBarScreen.routeName: (context) => StudentTabBarScreen(),
          FacultyTabBarScreen.routeName: (context) => FacultyTabBarScreen(),
          StudentHomeScreen.routeName: (context) => StudentHomeScreen(),
          FacultyHomeScreen.routeName: (context) => FacultyHomeScreen(),
        },
      ),
    );
  }
}
