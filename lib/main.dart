import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/home_page.dart';
import 'screens/projects_page.dart';
import 'screens/about_me_page.dart';
import 'screens/contact_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Responsive Portfolio',
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontFamily: 'Montserrat', fontSize: 18.sp),
              bodyMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 16.sp),
              displayLarge: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
              labelLarge: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18.sp,
              ),
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/projects': (context) => ProjectsPage(),
            '/about': (context) => AboutMePage(),
            '/contact': (context) => ContactPage(),
          },
        );
      },
    );
  }
}
