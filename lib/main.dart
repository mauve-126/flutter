import 'package:flutter/material.dart';
import 'first.dart';
import 'second.dart';
import 'home.dart';
void main()  {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}//떠한 동적 상태도 가지고 있지 않는 위젯

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), First(), Second()];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: _children[_currentIndex],

        //Center 말고 SafeArea로 넣으면 상단바 영역에 겹치지 않게
        //표기하게 할 수 있음 중앙 아니고 위에서부터 채워짐
        //Container 차지할 수 있는 최선의 영역으

        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            //현재 선택된 Index
            onTap: _onTap,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                title: Text('First'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Second'),
              )
            ]
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



