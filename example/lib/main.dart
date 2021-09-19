import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialSegmentedControl(
                strokeWidth: 2,
                isCupertinoStyle: true,
                children: _children,
                selectionIndex: _currentSelection,
                borderColor: Colors.grey,
                selectedColor: Colors.redAccent,
                unselectedColor: Colors.white,
                borderRadius: 8.0,
                disabledChildren: _disabledIndices,
                onSegmentChosen: (index) {
                  setState(() {
                    _currentSelection = index;
                  });
                },
              ),
              SizedBox(
                height: 8,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Toggle disabled'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // This is just an example on how disabled children work.
                      // A disabled index is determined randomly.
                      setState(() {
                        _disabledIndices.clear();
                        _disabledIndices.add(_randomInt());
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text('Un-select all'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => setState(() => _currentSelection = null),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<int, Widget> _children = {
    0: Text('Hummingbird'),
    1: Text('Kiwi'),
    2: Text('Rio'),
    3: Text('Telluraves')
  };

  // Holds all indices of children to be disabled.
  // Set this list either null or empty to have no children disabled.
  List<int> _disabledIndices = [];

  int _randomInt() {
    return Random.secure().nextInt(_children.length);
  }
}
