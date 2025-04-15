import 'package:core/src/screen/screen0_home/widget/impl/card_type.dart';
import 'package:core/src/screen/screen0_home/widget/impl/general_card.dart';
import 'package:core/src/screen/screen0_home/widget/impl/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpCard extends StatelessWidget {
  const HelpCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralCard(
        cardType: CardType.common,
        marginAll: 16,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Tutorial card", style: TextStyles.big),
              const SizedBox(height: 16),
              SizedBox(
                  height: 180,
                  width: 140,
                  child: GeneralCard(
                      cardType: CardType.insideTutorial,
                      child: Center(
                          child: Text("Flutter\ninterview\nquestion",
                              style: TextStyles.normalWithLessSpaceBetweenLines)))),
              const SizedBox(height: 8),
              Text("These memory cards help you check on which questions you don't remember", style: TextStyles.small),
              const SizedBox(height: 8),
              const Description(icon: Icons.shuffle, text: "shuffle cards"),
              const SizedBox(height: 8),
              const Description(icon: Icons.close, text: "I don't know the answer to the question"),
              const SizedBox(height: 8),
              const Description(icon: Icons.check, text: "I know the answer to the question"),
              const SizedBox(height: 8),
              const Description(icon: Icons.rotate_left_rounded, text: "revert back previous card"),
            ],
          ),
        ));
  }
}

class Description extends StatelessWidget {
  final IconData icon;
  final String text;
  const Description({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: CupertinoColors.systemGrey, size: 40),
        const SizedBox(width: 8),
        Text("--", style: TextStyles.normalWithLessSpaceBetweenLines),
        const SizedBox(width: 8),
        SizedBox(width: 200, child: Text(text, style: TextStyles.normalWithLessSpaceBetweenLines)),
      ],
    );
  }
}
