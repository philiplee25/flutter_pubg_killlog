import 'package:flutter/material.dart';
import 'package:pubg_killlog/presentation/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '망겜 킬로그',
      debugShowCheckedModeBanner: false, // 오른쪽 위 debug 마크 떼기
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KillLogScreen(),
    );
  }
}
