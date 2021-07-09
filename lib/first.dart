import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {

  List<dynamic> questions = [
    "안녕하세요 질문입니다",
    "안녕하세요 질문입니다 안녕하세요 질문입니다안녕하세요 질문입니다안녕하세요 질문입니다안녕하세요 질문입니다안녕하세요 질문입니다안녕하세요 질문입니다안녕하세요 질문입니다",
    "안녕하세요 질문입니다",
    "안녕하세요 질문입니다",
    "안녕하세요 질문입니다"
  ];

  @override
  Widget build(BuildContext context) {
    var _listView = ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Text(questions[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );

    return Scaffold(
        body: Center(
        child: GestureDetector(
        onTap: () {
      print('Tapped!');
    },
      child: _listView,
    ),
        ),
    );
  }
}



