import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
        automaticallyImplyLeading: true, // This will show the back button
      ),
      body: Container(
        decoration: BoxDecoration(
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProjectCard(),
            SizedBox(height: 20.h),
            _buildProjectCard(),
            SizedBox(height: 20.h),
            _buildProjectCard(),
            SizedBox(height: 20.h),
            _buildProjectCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProjectCard(),
            SizedBox(height: 20.h),
            _buildProjectCard(),
            SizedBox(height: 20.h),
            _buildProjectCard(),
            SizedBox(height: 20.h),
            _buildProjectCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Title',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Project Description',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('View Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
