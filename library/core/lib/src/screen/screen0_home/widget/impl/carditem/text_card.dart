import 'package:core/src/screen/screen0_home/widget/impl/card_type.dart';
import 'package:core/src/screen/screen0_home/widget/impl/general_card.dart';
import 'package:core/src/screen/screen0_home/widget/impl/model/card_model.dart';
import 'package:core/src/screen/screen0_home/widget/impl/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final TextQuestionModel model;
  const TextCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralCard(
        cardType: CardType.common, marginAll: 16, child: Center(child: Text(model.question, style: TextStyles.normal)));
  }
}
