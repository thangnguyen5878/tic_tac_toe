// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_colors.dart';
import 'package:flutter_tic_tac_toe/utils/constants/app_styles.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';


class CustomCard extends StatelessWidget {
  final onTap;
  final subtitle;
  final title;

  const CustomCard({
    Key? key,
    this.onTap,
    this.subtitle,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: kBrown15,
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        onTap: onTap,
        title: Padding(
          padding: EdgeInsets.only(bottom: 10), // Add padding here
          child: Text(title, style: kHeading2),
        ),
        subtitle: Text(
          subtitle,
          style: kNormal,
        ),
      ),
    );
  }
}

// '${player1.name} (${player1.score}) - ${player2.name} (${player2.score}), round: ${room.roundCount}'),
