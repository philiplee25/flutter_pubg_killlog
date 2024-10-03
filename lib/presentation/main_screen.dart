import 'package:flutter/material.dart';

class KillLogScreen extends StatefulWidget {
  const KillLogScreen({super.key});

  @override
  State<KillLogScreen> createState() => _KillLogScreenState();
}

class _KillLogScreenState extends State<KillLogScreen> {
  // 각 ListTile 의 팀명, 살아남은 수 저장하는 초기 map list
  List<Map<String, dynamic>> initItems = [
    {'team': '1 팀', 'live': 4},
    {'team': '2 팀', 'live': 4},
    {'team': '3 팀', 'live': 4},
    {'team': '4 팀', 'live': 4},
    {'team': '5 팀', 'live': 4},
    {'team': '6 팀', 'live': 4},
    {'team': '7 팀', 'live': 4},
    {'team': '8 팀', 'live': 4},
    {'team': '9 팀', 'live': 4},
    {'team': '10 팀', 'live': 4},
    {'team': '11 팀', 'live': 4},
    {'team': '12 팀', 'live': 4},
    {'team': '13 팀', 'live': 4},
    {'team': '14 팀', 'live': 4},
    {'team': '15 팀', 'live': 4},
    {'team': '16 팀', 'live': 4},
  ];

  // 남은 인원 수를 어떤 식으로 해야할 지 모루겠다. 일단 default 64명~
  int totalLive = 64;
  int totalDead = 0;

  // 현재 상태 저장하는 리스트
  List<Map<String, dynamic>> items = [];

  // 새게임 시작하면 reset 버튼 누르기용 initState
  @override
  void initState() {
    super.initState();
    resetItems();
  }

  // ListTile 클릭 시 호출되는 함수
  void _killCounter(int index) {
    setState(() {
      if (items[index]['live'] > 0) {
        // 클릭할때마다 live 감소
        items[index]['live']--;
      }

      // 사망한 인원은 1씩 늘어나고 생존인원은 1씩 줄어듦
      totalLive--;
      totalDead++;
    });
  }

  // reset 함수
  void resetItems() {
    setState(() {
      items = initItems.map((item) => Map<String, dynamic>.from(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('망겜의 킬로그~'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$totalDead 명 사망'),
                  Text('$totalLive 명 생존'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4개의 열로 구성
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: items[index]['live'] > 0
                        ? () => _killCounter(index)
                        : null,
                    child: GridTile(
                      header: Center(
                        child: Text(
                          items[index]['team'],
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      child: Container(
                        color: items[index]['live'] > 0 ? null : Colors.red,
                        child: Center(
                          child: Text(
                            items[index]['live'].toString(),
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
            child: OutlinedButton(
              onPressed: resetItems,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('잘 걸렀다~ 다음 게임~'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
