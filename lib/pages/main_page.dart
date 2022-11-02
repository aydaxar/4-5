import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Map'),
              leading: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: LikeButton(
                  size: 20,
                  circleColor: const CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff00999c)),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeCount: 0,
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.blueGrey,
                      size: 20,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}