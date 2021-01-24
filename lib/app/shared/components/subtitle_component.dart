import 'package:flutter/cupertino.dart';

class SubtitleComponent extends StatelessWidget {
  final String image;
  final String text;
  final TextStyle style;

  SubtitleComponent(this.image, this.text, this.style);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
          ),
          Text(
            text,
            style: style,
          )
        ],
      ),
    );
  }
}
