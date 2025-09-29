import 'package:flutter/material.dart';
import 'package:my_app/pages/title.dart';
import 'package:flutter/services.dart';

void main() {
  // 1. 위젯 바인딩 초기화 보장
  WidgetsFlutterBinding.ensureInitialized();

  // 2. 화면 방향을 가로모드로 강제 고정합니다.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft, // 왼쪽으로 기울인 가로
    DeviceOrientation.landscapeRight, // 오른쪽으로 기울인 가로
  ]).then((value) => runApp(const MyApp())); // 방향 설정이 완료된 후 앱을 실행합니다.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guitar Chord',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TitleScreen(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('테스트용 메시지'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
