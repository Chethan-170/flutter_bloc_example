import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Learning BloC"),
        ),
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Center(child: Text('The counter value is: '))]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => {},
              child: const Icon(Icons.remove),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () => {},
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
