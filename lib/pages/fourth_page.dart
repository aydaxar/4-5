import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});


  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  List products = ['Привет', 'Hello', 'Bye', 'ByeBye'];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text('${products[index]}'),
                trailing: ConstrainedBox(
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
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.blueGrey,
                        size: 20,
                      );
                    },
                    likeCount: 0,
                  ),
                ));
          },
        ),
      ),
    );
  }
}