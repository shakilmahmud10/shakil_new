import 'package:flutter/material.dart';
import 'package:shakil_new/reuseable_widget/icon_widget.dart';
import 'package:shakil_new/reuseable_widget/icon_widget2.dart';
import 'package:shakil_new/reuseable_widget/icon_widget3.dart';

import 'dialog_widget1.dart';

class Reuseablewidget extends StatelessWidget {
  const Reuseablewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reuseable Widget'),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IconWidget(),
                ),
              );
            },
            child: const Text("Icon widget-1"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IconWidget2(),
                ),
              );
            },
            child: Text('Icon widget-2'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DialogWidget1(),
                ),
              );
            },
            child: Text('Dialog widget-1'),
          ),
        ]),
      ),
    );
  }
}
