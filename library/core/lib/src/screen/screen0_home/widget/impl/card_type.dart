import 'package:flutter/material.dart';

// const LinearGradient gradientRed = LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: [
//     Color(0xFFFF3868),
//     Color(0xFFFFB49A),
//   ],
// );
//
// const LinearGradient gradientPurple = LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: [
//     Color(0xFF736EFE),
//     Color(0xFF62E4EC),
//   ],
// );
//
// const LinearGradient gradientBlue = LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: [
//     Color(0xFF0BA4E0),
//     Color(0xFFA9E4BD),
//   ],
// );
//
// const LinearGradient gradientPink = LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: [
//     Color(0xFFFF6864),
//     Color(0xFFFFB92F),
//   ],
// );
//
// const LinearGradient kNewFeedCardColorsIdentityGradient = LinearGradient(
//   begin: Alignment.topCenter,
//   end: Alignment.bottomCenter,
//   colors: [
//     Color(0xFF7960F1),
//     Color(0xFFE1A5C9),
//   ],
// );

// // 1. М’ятний бриз
// Color(0xFFB2E7D3), // м’який м’ятний зелений
// Color(0xFFE0F7E9), // ніжний блідо-зелений
//
// // 2. Рожевий захід
// Color(0xFFF9C1CC), // ніжний рожевий
// Color(0xFFFFE4E8), // блідо-рожевий
//
// // 3. Лавандова мрія
// Color(0xFFD4CCF7), // м’який лавандовий
// Color(0xFFECE6FF), // блідо-фіолетовий
//
// // 4. Персиковий настрій
// Color(0xFFFFDAB9), // теплий персиковий
// Color(0xFFFFF0E1), // кремовий персик
//
// // 5. Блакитна лагуна
// Color(0xFFB3E5FC), // ніжний блакитний
// Color(0xFFE1F5FE), // блідо-голубий
//
// // 6. Блідий шепіт
// Color(0xFFE8ECEF), // світлий сірий
// Color(0xFFF5F6F5), // блідо-сірий

enum CardType {
  insideTutorial(colorStart: Color(0xFF736EFE), colorEnd: Color(0xFF62E4EC)),
  // common(colorStart: Color(0xFF736EFE), colorEnd: Color(0xFF62E4EC));
  common(colorStart: Color(0xFFD4CCF7), colorEnd: Color(0xFFECE6FF));

  final Color colorStart;
  final Color colorEnd;
  const CardType({required this.colorStart, required this.colorEnd});
}
