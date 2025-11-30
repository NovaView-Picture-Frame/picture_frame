import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final MemoryImage image;

  const ImageWidget({super.key, required this.image});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: widget.image,
    );
  }
}
