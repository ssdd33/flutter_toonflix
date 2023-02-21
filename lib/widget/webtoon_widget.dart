import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final WebtoonModel webtoon;
  const Webtoon({super.key, required this.webtoon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tap');
        Navigator.push(
            context,
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => DetailScreen(
                      title: webtoon.title,
                      thumb: webtoon.thumb,
                      id: webtoon.id,
                    )));
        // PageRouteBuilder(
        //     transitionsBuilder:
        //         (context, animation, secondaryAnimation, child) {
        //       var begin = const Offset(1.0, 0.0);
        //       var end = Offset.zero;
        //       var curve = Curves.ease;
        //       var tween = Tween(begin: begin, end: end)
        //           .chain(CurveTween(curve: curve));
        //       return SlideTransition(
        //         position: animation.drive(tween),
        //         child: child,
        //       );
        //     },
        //     pageBuilder: (context, animation, secondaryAnimation) =>
        //         DetailScreen(
        //             title: webtoon.title,
        //             thumb: webtoon.thumb,
        //             id: webtoon.id)));
      },
      child: Column(
        children: [
          Hero(
            tag: webtoon.id,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                ),
                width: 250,
                clipBehavior: Clip.hardEdge,
                child: Image.network(webtoon.thumb)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
