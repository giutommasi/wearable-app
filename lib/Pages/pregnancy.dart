class Pregnancy {
  final int week;

  Pregnancy(this.week);

  static final Map<int, String> _babySize = <int, String>{
    1: "Pomegranate Grain",
    2: "Bean",
    3: "Cherry",
    4: "Apricot",
    5: "Apple",
    6: "Lemon",
    7: "Avocado",
    8: "Pear",
    9: "Orange",
    10: "Mango",
    11: "Garnet",
    12: "Papaya",
    13: "Pomelo",
    14: "Eggplant",
    15: "Pumpkin",
    16: "Watermelon",
    17: "Melon",
    18: "Pumpkin",
  };

  int getBabyPhase() {
    if (week > 1 && week < 5) return 1;
    if (week >= 5 && week < 7) return 2;
    if (week >= 7 && week <= 8) return 3;
    if (week >= 9 && week <= 10) return 4;
    if (week >= 11 && week <= 13) return 5;
    if (week >= 14 && week <= 15) return 6;
    if (week >= 16 && week <= 17) return 7;
    if (week >= 18 && week <= 19) return 8;
    if (week >= 20 && week <= 21) return 9;
    if (week >= 22 && week <= 23) return 10;
    if (week >= 24 && week <= 26) return 11;
    if (week >= 27 && week <= 28) return 12;
    if (week >= 29 && week <= 30) return 13;
    if (week >= 31 && week <= 32) return 14;
    if (week >= 33 && week <= 35) return 15;
    if (week >= 36 && week <= 37) return 16;
    if (week >= 38 && week <= 39) return 17;
    if (week == 40) return 18;

    return 1;
  }

  String getBabySize() {
    if (week > 1 && week < 5) return _babySize[1]!;
    if (week >= 5 && week < 7) return _babySize[2]!;
    if (week >= 7 && week <= 8) return _babySize[3]!;
    if (week >= 9 && week <= 10) return _babySize[4]!;
    if (week >= 11 && week <= 13) return _babySize[5]!;
    if (week >= 14 && week <= 15) return _babySize[6]!;
    if (week >= 16 && week <= 17) return _babySize[7]!;
    if (week >= 18 && week <= 19) return _babySize[8]!;
    if (week >= 20 && week <= 21) return _babySize[9]!;
    if (week >= 22 && week <= 23) return _babySize[10]!;
    if (week >= 24 && week <= 26) return _babySize[11]!;
    if (week >= 27 && week <= 28) return _babySize[12]!;
    if (week >= 29 && week <= 30) return _babySize[13]!;
    if (week >= 31 && week <= 32) return _babySize[14]!;
    if (week >= 33 && week <= 35) return _babySize[15]!;
    if (week >= 36 && week <= 37) return _babySize[16]!;
    if (week >= 38 && week <= 39) return _babySize[17]!;
    if (week == 40) return _babySize[18]!;

    return "";
  }
}
