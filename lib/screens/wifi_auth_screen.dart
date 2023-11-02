import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WifiAuth extends StatefulWidget {
  const WifiAuth({super.key});

  @override
  State<WifiAuth> createState() => _WifiAuthState();
}

class _WifiAuthState extends State<WifiAuth> {
  late Future<String> ip;

  Future<String> getPublicIP() async {
    var response =
        await http.get(Uri.parse('https://api.ipify.org?format=json'));

    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> data = jsonDecode(response.body);
      String ip = data['ip'];
      print(ip);
      return ip;
    } else {
      throw Exception('Failed to load IP address');
    }
  }

  @override
  void initState() {
    ip = getPublicIP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.4,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Lottie.asset('assets/lotties/wifi.json'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Wi-Fi Crendetials Checking',
              style: TextStyle(
                color: Color.fromRGBO(24, 119, 242, 1),
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Lottie.asset(
              'assets/lotties/dot loading.json',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.width * 0.02,
            ),
          ],
        )
      ],
    );
  }
}
