import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:wifi_attendance_app/models%20&%20providers/user_data.dart';
import 'package:wifi_attendance_app/screens/student/student_home_screen.dart';
import 'package:wifi_attendance_app/screens/wifi_auth_screen.dart';
import 'package:wifi_attendance_app/widgets/profile_container.dart/student_profile_container.dart';

class StudentTabBarScreen extends StatefulWidget {
  static const routeName = '/StudentTabBarScreen';

  const StudentTabBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentTabBarScreen> createState() => _StudentTabBarScreenState();
}

class _StudentTabBarScreenState extends State<StudentTabBarScreen> {
  List<Map<String, dynamic>> _pages = [];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': StudentHomeScreen(),
      },
      {
        'page': WifiAuth(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context).student;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            StudentProfileContainer(
              name: data['name'],
              branch: data['branch'],
              enrollment_no: data['enrollment_no'],
              sem: data['semester'],
              image_url: data['image'],
            ),
            _pages[_selectedPageIndex]['page'],
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(204, 204, 204, 1),
                borderRadius: BorderRadius.all(Radius.circular(35))),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GNav(
                onTabChange: _selectPage,
                color: Colors.black,
                activeColor: Colors.white,
                tabBackgroundColor: Theme.of(context).primaryColor,
                gap: 10,
                padding: EdgeInsets.all(20),
                tabs: const [
                  GButton(
                    icon: Icons.history_rounded,
                    text: 'History',
                    textColor: Color.fromRGBO(204, 204, 204, 1),
                    textSize: 5,
                  ),
                  GButton(
                    icon: Icons.how_to_reg_rounded,
                    text: 'Mark Attendance',
                    textColor: Color.fromRGBO(204, 204, 204, 1),
                    textSize: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
