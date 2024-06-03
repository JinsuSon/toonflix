import 'package:flutter/material.dart';

class DetaiScreen extends StatelessWidget {
  final String title, thumb, id;
  const DetaiScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ]),
    );
  }
}
