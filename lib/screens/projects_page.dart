import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
            colors: [
              Colors.purpleAccent,
              Colors.deepPurple,
              Colors.deepPurpleAccent
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return _buildWideLayout(
                    context, constraints, 3); // Three columns
              } else if (constraints.maxWidth > 600) {
                return _buildWideLayout(context, constraints, 2); // Two columns
              } else {
                return _buildNarrowLayout(
                    context, constraints); // Single column
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout(
      BuildContext context, BoxConstraints constraints, int columns) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
                childAspectRatio: 0.75,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return _buildProjectCard(
                  context,
                  constraints,
                  projects[index]['title']!,
                  projects[index]['description']!,
                  projects[index]['githubLink']!,
                  projects[index]['imagePath']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: projects.map((project) {
            return Column(
              children: [
                _buildProjectCard(
                  context,
                  constraints,
                  project['title']!,
                  project['description']!,
                  project['githubLink']!,
                  project['imagePath']!,
                ),
                SizedBox(height: 20.h),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    BoxConstraints constraints,
    String title,
    String description,
    String githubLink,
    String imagePath,
  ) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 5),
            Container(
              height: constraints.maxWidth > 600
                  ? 200.h
                  : 120.h, // Adjust height based on screen size
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit
                    .fitWidth, // Ensures the image covers the area without distortion
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (await canLaunch(githubLink)) {
                      await launch(githubLink);
                    } else {
                      throw 'Could not launch $githubLink';
                    }
                  },
                  child: Text(
                    'View GitHub',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> projects = [
  {
    'title': 'Flutter-Weather-App',
    'description': 'Flutter Project 1',
    'githubLink': 'https://github.com/chiragmali19/Flutter-Weather-Application.git',
    'imagePath': 'assets/images/weather app.png',
  },
  {
    'title': 'Online-Music-Application',
    'description': 'Flutter Project 2',
    'githubLink':
        'https://github.com/chiragmali19/Flutter-Online-Music-Application.git',
    'imagePath': 'assets/images/music.png',
  },
  {
    'title': 'Responsive-Portfolio-App',
    'description': 'Flutter Project 3',
    'githubLink':
        'https://github.com/chiragmali19/Flutter-Responsive-Portfolio-App-Web.github.io.git',
    'imagePath': 'assets/images/portfolio.png',
  },
  {
    'title': 'Netflix-clone',
    'description': 'HTML Project 1',
    'githubLink': 'https://github.com/chiragmali19/Netflix-clone.github.io.git',
    'imagePath': 'assets/images/net.png',
  },
  {
    'title': 'Resposive-web-Portfolio',
    'description': 'HTML Project 2',
    'githubLink': 'https://github.com/chiragmali19/resposive-web-portfolio.git',
    'imagePath': 'assets/images/portfolioweb.png',
  },
];
