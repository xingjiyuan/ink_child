import 'package:flutter/material.dart';
import 'package:ink_child/ink_child.dart';

main() {
  return MaterialApp(
    home: buildButton("", "text", _onTap),
  );
}

void _onTap() {
  print("_onTap");
}

Widget buildButton(String assetImage, String text, GestureTapCallback _onTap) {
  InkBox inkBox = InkBox(child: Text("test"));

  InkChildWidget inkResponse = InkChildWidget(
      inkBox: inkBox,
      child: Container(
          width: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              inkBox,
              Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 14, color: Color(0xFF313E44)),
                ),
              ),
            ],
          )),
      customBorder: CircleBorder(),
      onTap: _onTap);
  return Material(
    child: inkResponse,
    color: Colors.white,
  );
}
