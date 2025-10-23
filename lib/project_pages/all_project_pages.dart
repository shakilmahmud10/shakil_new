import 'package:flutter/material.dart';

import 'dua.dart';
import 'quranGeneralSetting.dart';
import 'search_bottom_sheet.dart';

class AllProjectPages extends StatelessWidget {
  const AllProjectPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Given Projects'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Qurangeneralsetting(),
                ),
              );
            },
            child: const Text("Setting page"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DuaPage(),
                ),
              );
            },
            child: const Text("Dua page"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomSheetSearch(),
                ),
              );
            },
            child: const Text("Search Bottom Sheet"),
          )
        ]),
      ),
    );
  }
}