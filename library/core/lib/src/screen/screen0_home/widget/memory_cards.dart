import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:core/src/screen/screen0_home/widget/impl/carditem/image_card.dart';
import 'package:core/src/screen/screen0_home/widget/impl/model/card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'impl/card_buttons.dart';
import 'impl/carditem/help_card.dart';
import 'impl/carditem/text_card.dart';

var cards = cardModels;

class MemoryCards extends StatefulWidget {
  const MemoryCards({super.key});

  @override
  State<MemoryCards> createState() => _MemoryCardsState();
}

class _MemoryCardsState extends State<MemoryCards> {
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      _shakeCard();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .75,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 0,
              bottom: 40,
            ),
            child: AppinioSwiper(
              invertAngleOnBottomDrag: true,
              backgroundCardCount: 3,
              swipeOptions: const SwipeOptions.all(),
              controller: controller,
              onCardPositionChanged: (
                SwiperPosition position,
              ) {
                //debugPrint('${position.offset.toAxisDirection()}, '
                //    '${position.offset}, '
                //    '${position.angle}');
              },
              onSwipeEnd: _swipeEnd,
              onEnd: _onEnd,
              cardCount: cards.length,
              cardBuilder: (BuildContext context, int index) {
                var cardModel = cards[index];
                return switch (cardModel) {
                  HelpModel() => const HelpCard(),
                  TextQuestionModel(question: var _) => TextCard(model: cardModel),
                  ImageQuestionModel(imagePath: var _) => ImageCard(model: cardModel),
                };
              },
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: IconTheme.merge(
            data: const IconThemeData(size: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Spacer(),
                // TutorialAnimationButton(_shakeCard),
                const Spacer(),
                ShuffleAnimationButton(() {
                  _removeTutorialCard();
                  _shuffleCards();
                }),
                const Spacer(),
                swipeLeftButton(controller),
                const Spacer(),
                swipeRightButton(controller),
                const Spacer(),
                unswipeButton(controller),
                const Spacer(),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        _log('The card was swiped to the : ${activity.direction}');
        _log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case Unswipe():
        _log('A ${activity.direction.name} swipe was undone.');
        _log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case CancelSwipe():
        _log('A swipe was cancelled');
        break;
      case DrivenActivity():
        _log('Driven Activity');
        break;
    }
  }

  void _onEnd() {
    _log('end reached!');
  }

  // Animates the card back and forth to teach the user that it is swipable.
  Future<void> _shakeCard() async {
    const double distance = 30;
    // We can animate back and forth by chaining different animations.
    await controller.animateTo(
      const Offset(-distance, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    await controller.animateTo(
      const Offset(distance, 0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    // We need to animate back to the center because `animateTo` does not center
    // the card for us.
    await controller.animateTo(
      const Offset(0, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _removeTutorialCard() {
    cards.removeWhere((card) => card is HelpModel);
  }

  void _shuffleCards() {
    setState(() {
      cards.shuffle();
    });
  }

  void _log(String str) {
    print(str);
  }
}
