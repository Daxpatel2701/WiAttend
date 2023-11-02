import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wifi_attendance_app/models%20&%20providers/user_data.dart';

class FacultyHomeScreen extends StatefulWidget {
  const FacultyHomeScreen({Key? key}) : super(key: key);

  static const routeName = '/FacultyHomeScreen';

  @override
  _FacultyHomeScreenState createState() => _FacultyHomeScreenState();
}

class _FacultyHomeScreenState extends State<FacultyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final subjectData = Provider.of<Data>(context).subject;
    TextEditingController _dropdownController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Select Subject : ',
              style: Theme.of(context).textTheme.bodySmall,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: DropdownMenu(
              controller: _dropdownController,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
              trailingIcon: Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: Colors.black,
              ),
              initialSelection: subjectData[0],
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Color.fromRGBO(204, 204, 204, 1),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              menuStyle: MenuStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(5)),
                  shadowColor: MaterialStatePropertyAll(Colors.black),
                  visualDensity: VisualDensity.standard,
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(204, 204, 204, 1)),
                  elevation: MaterialStatePropertyAll(20),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))))),
              dropdownMenuEntries: subjectData.map((String subject) {
                return DropdownMenuEntry(
                  value: subject,
                  label: subject,
                  style: ButtonStyle(
                      animationDuration: Duration(milliseconds: 1000),
                      textStyle: MaterialStatePropertyAll(
                          Theme.of(context).textTheme.bodySmall)),
                );
              }).toList()),
        ),
      ],
    );
  }
}
