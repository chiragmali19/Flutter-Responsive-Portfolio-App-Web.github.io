import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMePage extends StatelessWidget {
  final String cvUrl = "https://example.com/your-cv.pdf";

  const AboutMePage({super.key}); // Update with your CV URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue,
              Colors.deepOrangeAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    // Large screen layout
                    return _buildLargeScreenLayout(context);
                  } else {
                    // Small screen layout
                    return _buildSmallScreenLayout(context);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLargeScreenLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'INFORMATION ABOUT ME',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: 20.h),
              Text(
                "Hello! I'm Chirag Mali, a passionate and creative Flutter developer currently in my final year of IT studies at Indus University, Ahmedabad, with an SGPA of 7.5. I have a robust background in full-stack Android development, specializing in creating visually appealing and highly functional applications using Flutter, Dart, and Firebase.",
                style: TextStyle(fontSize: 10.sp, color: Colors.white),
              ),
              SizedBox(height: 20.h),
              _buildProjectStats('10+', 'Projects completed with Flutter'),
              SizedBox(height: 10.h),
              _buildProjectStats('5', 'Projects completed with HTML, CSS'),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MY SKILLS',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: 20.h),
              _buildSkillSlider('Flutter', 90),
              _buildSkillSlider('Firebase', 85),
              _buildSkillSlider('HTML', 75),
              _buildSkillSlider('CSS', 75),
              _buildSkillSlider('Java', 87),
              SizedBox(height: 20.h),
              _buildDownloadCVButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmallScreenLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'INFORMATION ABOUT ME',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        SizedBox(height: 20.h),
        Text(
          "Hello! I'm Chirag Mali, a passionate and creative Flutter developer currently in my final year of IT studies at Indus University, Ahmedabad, with an SGPA of 7.5. I have a robust background in full-stack Android development, specializing in creating visually appealing and highly functional applications using Flutter, Dart, and Firebase.",
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
        SizedBox(height: 20.h),
        _buildProjectStats('10+', 'Projects completed with Flutter'),
        SizedBox(height: 10.h),
        _buildProjectStats('5', 'Projects completed with HTML, CSS'),
        SizedBox(height: 20.h),
        Text(
          'MY SKILLS',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        SizedBox(height: 20.h),
        _buildSkillSlider('Flutter', 90),
        _buildSkillSlider('Firebase', 85),
        _buildSkillSlider('HTML', 75),
        _buildSkillSlider('CSS', 75),
        _buildSkillSlider('Java', 87),
        SizedBox(height: 20.h),
        _buildDownloadCVButton(context),
      ],
    );
  }

  Widget _buildProjectStats(String count, String label) {
    return Text(
      '$count $label',
      style: TextStyle(fontSize: 10.sp, color: Colors.white),
    );
  }

  Widget _buildSkillSlider(String skill, int percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: TextStyle(fontSize: 12.sp, color: Colors.white),
        ),
        SizedBox(height: 10.h),
        LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: Colors.grey.shade400,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade900),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget _buildDownloadCVButton(BuildContext context) {
    return GestureDetector(
      onTap: _launchCV,
      child: Container(
        width: 0.5.sw, // Adjust width proportionally
        height: 50.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade600, Colors.blue.shade900],
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.file_download,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(width: 10.w),
              Text(
                'Download CV',
                style: TextStyle(
                  fontSize: 20, // Responsive font size
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

  void _launchCV() async {
    if (await canLaunch(cvUrl)) {
      await launch(cvUrl);
    } else {
      throw 'Could not launch $cvUrl';
    }
  }
}
