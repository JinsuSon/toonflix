import 'package:flutter/material.dart';
import 'package:toonflix/screens/detai_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // 하나의 위젯을 스크린 페이지처럼 보여줄 수 있는 위젯
            builder: (context) =>
                DetaiScreen(title: title, thumb: thumb, id: id),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge, // border-radius 적용 안될 때 꼭 넣어보자
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.5), // withOpacity 범위 0 ~ 1.0 까지
                    blurRadius: 3,
                    offset: const Offset(5, 5),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                headers: const {
                  'User-Agent':
                      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'
                },
                width: 150,
                thumb,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}
