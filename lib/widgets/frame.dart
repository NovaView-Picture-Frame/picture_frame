import 'package:flutter/material.dart';

import './image_widget.dart';
import './info_card.dart';
import '../models/photo.dart';

class Frame extends StatelessWidget {
  final Photo photo;

  const Frame({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageWidget(image: photo.image),
        Positioned(
          bottom: 32,
          right: 32,
          child: InfoCard(
            make: photo.make,
            model: photo.model,
            place: photo.place,
            datetime: photo.datetime,
          ),
        ),
      ],
    );
  }
}
