import 'package:flutter/material.dart';


class Drop extends StatefulWidget {
  const Drop({super.key});

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    "data",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.yellow,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(

            value: dropdownvalue,

            icon: const Icon(Icons.keyboard_arrow_down),

            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          //  Cb(text: '')
        ],
      ),
    );
  }
}