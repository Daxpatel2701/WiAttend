import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnName;
  final Function Navigator;
  const Button({Key? key, required this.btnName, required this.Navigator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
          onPressed: () {
            Navigator();
          },
          style: ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
            backgroundColor:
                MaterialStatePropertyAll(Theme.of(context).primaryColor),
            side: MaterialStatePropertyAll(
              BorderSide(
                  color: Theme.of(context).secondaryHeaderColor, width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                btnName,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).secondaryHeaderColor),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ],
          )),
    );
  }
}
