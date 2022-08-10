import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  TextOverflow textOverflow;
  FontWeight? fontWeight;
  double? fontSize;

  TextWidget({Key? key, required this.color, this.textOverflow = TextOverflow
      .ellipsis, required this.fontSize, required this.text, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        overflow: textOverflow,
      ),
    );
  }
}
