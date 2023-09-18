import 'package:app_turismo_usuario/Recursos/theme/app_theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  //final bool? showButton;

  const ExpandableText({
    super.key,
    required this.text,
    this.maxLines = 1,
    this.textStyle = const TextStyle(),
    this.textAlign,
    //this.showButton = true
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          maxLines: isExpanded ? null : 3, //widget.maxLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: widget.textStyle,
          textAlign: widget.textAlign,
        ),
        if (!isExpanded && widget.text.length > (widget.maxLines ?? 1))
          TextButton(
            onPressed: () {
              setState(() {
                isExpanded = true;
              });
            },
            child: const Text(
              'Ver más...',
              style: TextStyle(
                  color: AppBasicColors.lightGrey, fontWeight: FontWeight.bold),
            ),
          ),
        if (isExpanded)
          IconButton(
              onPressed: () {
                setState(() {
                  isExpanded = false;
                });
              },
              icon: const Icon(
                BootstrapIcons.arrow_up_circle_fill,
                color: AppBasicColors.blue,
                size: 30.0,
              ))
      ],
    );
  }
}
