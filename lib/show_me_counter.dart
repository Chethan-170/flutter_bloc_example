import 'package:flutter/material.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
          child: Text(
        '0',
        style: TextStyle(fontSize: 52.0),
      )),
    );
  }
}
