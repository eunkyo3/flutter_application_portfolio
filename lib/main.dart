import 'package:flutter/material.dart';
import 'package:flutter_application_portfolio/dice/my_dice.dart';
import 'package:flutter_application_portfolio/my_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 언더바로 시작하는 이유 : private변수(현재에서만)
  int _index = 0;
  // 하단 메뉴 아이템들의 배열
  List<BottomNavigationBarItem> items = [];
  late Widget body_page; // dynamic body_page;
  List<dynamic> pages = [
    const MyTimer(),
    const MyTimer(),
    const MyDice(),
    const MyTimer()
  ];

  void move_page(int page) {
    setState(() {
      _index = page;
      body_page = pages[page];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); // super : 부모
    items.add(const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: '홈', backgroundColor: Colors.amber));
    items.add(const BottomNavigationBarItem(
        icon: Icon(Icons.access_time_filled_rounded),
        activeIcon: Icon(
          Icons.access_time_filled_rounded,
          color: Colors.red,
        ),
        label: '타이머',
        backgroundColor: Colors.blue));
    items.add(const BottomNavigationBarItem(
        icon: Icon(Icons.checklist_rounded),
        label: '뽑기',
        backgroundColor: Colors.green));
    items.add(const BottomNavigationBarItem(
        icon: FaIcon(
          FontAwesomeIcons.comment,
          color: Colors.purple,
        ),
        label: '소개',
        backgroundColor: Colors.brown));

    // 첫페이지를 지정
    body_page = const Center(
      child: FaIcon(
        FontAwesomeIcons.delicious,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: body_page,
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              move_page(value);
            },
            // type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            // backgroundColor: Colors.cyan,
            items: items),
      ),
    );
  }
}
