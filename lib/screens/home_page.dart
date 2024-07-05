import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final String cvUrl =
      "https://example.com/your-cv.pdf"; // Update with your CV URL

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return _buildWideLayout(context);
              } else {
                return _buildNarrowLayout(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 40.w),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                CircleAvatar(
                  radius: 80.r,
                  backgroundImage:
                      const AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Chirag Mali',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 30, // Fixed font size
                      ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'I am a passionate Flutter developer with a knack for creating beautiful and functional applications. I love exploring new technologies and applying them to solve real-world problems.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20, color: Colors.white), // Fixed font size
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildButtons(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40.h),
          CircleAvatar(
            radius: 80.r,
            backgroundImage: const AssetImage('assets/images/profile.jpg'),
          ),
          SizedBox(height: 20.h),
          Text(
            'Chirag Mali',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28, // Fixed font size
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              'I am a passionate Flutter developer with a knack for creating beautiful and functional applications. I love exploring new technologies and applying them to solve real-world problems.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, color: Colors.white), // Fixed font size
            ),
          ),
          SizedBox(height: 20.h),
          _buildButtons(context),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _build3DButton(context, 'Download CV', _launchCV),
        SizedBox(height: 20.h),
        _build3DButton(
            context, 'About Me', () => _navigateTo(context, '/about')),
        SizedBox(height: 20.h),
        _build3DButton(
            context, 'Projects', () => _navigateTo(context, '/projects')),
        SizedBox(
          height: 20.h,
        ),
        _build3DButton(
            context, 'Contact Me', () => _navigateTo(context, '/contact')),
      ],
    );
  }

  Widget _build3DButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        width: 0.3.sw,
        height: 50.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade600, Colors.deepPurple.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(4, 4),
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.spMin,
              fontFamily: 'Montserrat',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _launchCV() async {
    if (await canLaunch(cvUrl)) {
      await launch(cvUrl);
    } else {
      throw 'Could not launch $cvUrl';
    }
  }

  void _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    ),
  );
}
