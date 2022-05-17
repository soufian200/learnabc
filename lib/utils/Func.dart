import 'dart:math';

class Funcs {
  static int getRandomColor() {
    List<int> colors = [
      0xFF7D1E6A,
      0xFF541690,
      0xFF187498,
      0xFF36AE7C,
      0xFF2155CD,
      0xFF112B3C,
      0xFFEB5353,
      0xFFE04D01,
      0xFF006E7F,
      0xFFB22727,
      0xFF005555,
      0xFF001E6C,
      0xFFF24A72,
      0xFFA97155,
      0xFF4D96FF,
      0xFF6BCB77,
      0xFF711A75,
    ];

    return colors[getRandomNumber(colors.length)];
  }

  static getRandomNumber(int maxRng) {
    var rng = Random();
    var rand = rng.nextInt(maxRng);
    return rand;
  }
}
