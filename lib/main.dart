import 'package:flutter/material.dart';

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

  // 하단 메뉴 아이템들의 배열
  List<BottomNavigationBarItem> items = [];
  dynamic body_page; // widget body_page <-- 위젯은 빈 공간이면 안됨. ? or late로 해결 가능
  @override
  void initState() {
    // TODO: implement initState
    super.initState(); // super : 부모
    items.add(const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: '홈', backgroundColor: Colors.amber));
    items.add(const BottomNavigationBarItem(
        icon: Icon(Icons.access_time_filled_rounded),
        label: '타이머',
        backgroundColor: Colors.red));
    items.add(const BottomNavigationBarItem(
        icon: Icon(Icons.checklist_rounded),
        label: '뽑기',
        backgroundColor: Colors.deepPurple));
    items.add(const BottomNavigationBarItem(
        icon: Icon(Icons.person), label: '소개', backgroundColor: Colors.brown));

    // 첫페이지를 지정
    body_page = const Center(
      child: Text('홈임시'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: null,
        body: body_page,
        bottomNavigationBar: BottomNavigationBar(
            // type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            // backgroundColor: Colors.cyan,
            items: items),
      ),
    );
  }
}
