import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Me'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 48, 112, 223),
              const Color.fromARGB(255, 113, 225, 238)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                _buildContactInfo(
                    context, Icons.location_on, 'Ahmedabad, Gujarat'),
                SizedBox(height: 20.h),
                _buildContactInfo(
                    context, Icons.email, 'malichirag1369@gmail.com'),
                SizedBox(height: 20.h),
                _buildContactInfo(context, Icons.phone, '+919537639248'),
                SizedBox(height: 20.h),
                _buildContactInfo(
                    context, Icons.language, 'Gujarati, Hindi, English'),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(FontAwesomeIcons.linkedin, 'LinkedIn',
                        'https://www.linkedin.com/in/chirag-mali-491b72278?/'),
                    SizedBox(width: 20.w),
                    _buildSocialButton(FontAwesomeIcons.github, 'GitHub',
                        'https://github.com/Chiragmali19'),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, IconData icon, String text) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // On larger screens, align info side by side
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 10.sp,
                color: Colors.white,
              ),
              SizedBox(width: 10.w),
              Text(
                text,
                style: TextStyle(fontSize: 8.sp, color: Colors.white),
              ),
            ],
          );
        } else {
          // On smaller screens, display info vertically
          return Column(
            children: [
              Icon(
                icon,
                size: 30.sp,
                color: Colors.white,
              ),
              SizedBox(height: 10.h),
              Text(
                text,
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildSocialButton(IconData icon, String text, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Container(
        width: 0.3.sw, // Adjust width proportionally
        height: 50.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade600, Colors.blue.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(4, 4),
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(width: 10.w),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12.sp, // Responsive font size
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
