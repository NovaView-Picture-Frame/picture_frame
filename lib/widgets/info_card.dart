import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatefulWidget {
  final String make;
  final String model;
  final String place;
  final DateTime datetime;

  const InfoCard({
    super.key,
    required this.make,
    required this.model,
    required this.place,
    required this.datetime,
  });

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  static final DateFormat _monthYearFormatter = DateFormat('MMMM yyyy');

  @override
  Widget build(BuildContext context) {
    final monthYear = _monthYearFormatter.format(widget.datetime);
  
    return Material(
      color: Colors.white.withAlpha(50),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        side: BorderSide(
          color: Colors.white.withAlpha(50),
          width: 4,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: 200,
          height: 75,
          padding: const EdgeInsets.all(14),
          child: DefaultTextStyle.merge(
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.place},  $monthYear'),
                Text(
                  '${widget.make} ${widget.model}',
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
