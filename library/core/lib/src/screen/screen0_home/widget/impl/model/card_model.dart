import 'package:core/const/resource.dart';
import 'package:flutter/cupertino.dart';

sealed class CardModel {}

final class TextQuestionModel extends CardModel {
  final String question;
  TextQuestionModel({required this.question});
}

final class ImageQuestionModel extends CardModel {
  final String? question;
  final String imagePath;
  ImageQuestionModel({required this.imagePath, this.question});
}

final class HelpModel extends CardModel {}

List<CardModel> cardModels = [
  HelpModel(),
  TextQuestionModel(
      question: "What OOP principles do you know? What language structures do we have in Dart to implement them?"),
  TextQuestionModel(question: "What can you say about the base class modifier"),
  ImageQuestionModel(
      imagePath: R.ASSETS_CODE_QUESTIONS_MIXINS_PNG,
      question: "Will the code below compile? What is the result of executing this code?"),
  ImageQuestionModel(
      imagePath: R.ASSETS_CODE_QUESTION_MODIFIER_PNG,
      question: "Tell us about all class modifiers found in the code below"),
  TextQuestionModel(question: "Tell me more about mixins. How can I use mixins, and what for?"),
  TextQuestionModel(question: "Can mixin contain an abstraction in its code? An abstract method or a field?"),
  TextQuestionModel(question: "How does const field differ from final field?"),
  TextQuestionModel(
      question:
          "If I use const applied to class instances in 2 different places. Will it create 2 different objects or one?"),
  ImageQuestionModel(
      imagePath: R.ASSETS_CODE_QUESTION_CONST_PNG,
      question: "Will the code below compile? What is the result of executing this code?"),
  ImageQuestionModel(
      imagePath: R.ASSETS_CODE_QUESTION_CONST_COLLECTIONS_PNG,
      question:
          "What the difference between const collections and final ones. const arrayList vs final arrayList what is the difference?"),
  TextQuestionModel(question: "Tell me about variable scope in Dart"),
];

const LinearGradient gradientRed = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF3868),
    Color(0xFFFFB49A),
  ],
);

const LinearGradient gradientPurple = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF736EFE),
    Color(0xFF62E4EC),
  ],
);

const LinearGradient gradientBlue = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0BA4E0),
    Color(0xFFA9E4BD),
  ],
);

const LinearGradient gradientPink = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF6864),
    Color(0xFFFFB92F),
  ],
);

const LinearGradient kNewFeedCardColorsIdentityGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF7960F1),
    Color(0xFFE1A5C9),
  ],
);
