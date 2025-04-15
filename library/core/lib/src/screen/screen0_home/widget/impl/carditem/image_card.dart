import 'package:core/src/app/widget_extension/assets.dart';
import 'package:core/src/screen/screen0_home/widget/impl/card_type.dart';
import 'package:core/src/screen/screen0_home/widget/impl/general_card.dart';
import 'package:core/src/screen/screen0_home/widget/impl/model/card_model.dart';
import 'package:core/src/screen/screen0_home/widget/impl/text_styles.dart';
import 'package:flutter/widgets.dart';

class ImageCard extends StatelessWidget {
  final ImageQuestionModel model;

  const ImageCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      cardType: CardType.common,
      marginAll: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (model.question != null) Text(model.question ?? "", style: TextStyles.normal),
          const SizedBox(height: 8),
          model.imagePath.imageAsset(),
        ],
      ),
    );
  }
}
