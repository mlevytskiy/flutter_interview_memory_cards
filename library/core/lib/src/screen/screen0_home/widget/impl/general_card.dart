import 'package:core/src/app/widget_extension/positioning.dart';
import 'package:core/src/screen/screen0_home/widget/impl/card_type.dart';
import 'package:flutter/cupertino.dart';

class GeneralCard extends StatelessWidget {
  final Widget child;
  final CardType cardType;
  final double marginAll;
  const GeneralCard({super.key, required this.child, required this.cardType, this.marginAll = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.white,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [cardType.colorStart, cardType.colorEnd]),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          if (marginAll == 0) child else child.padding(EdgeInsets.all(marginAll)),
        ],
      ),
    );
  }
}
