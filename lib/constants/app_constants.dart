import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  static final double paddingAppW = 16.w;
  static final double paddingAppH = 16.h;
  static final double paddingSlightW = 4.w;
  static final double paddingSlightH = 4.h;
  static final double paddingNormalW = 8.w;
  static final double paddingNormalH = 8.h;
  static final double paddingLargeW = 16.w;
  static final double paddingLargeH = 16.h;
  static final double paddingSuperLargeW = 40.w;
  static final double paddingSuperLargeH = 40.h;
  static final double cornerRadius = 8.w;
  static final double cornerRadiusFrame = 16.w;
  static final double cornerRadiusHighlightBox = 10.w;
  static final int dateDanger = 7;
}

enum GenderPick {
  Unpicked,
  Boy,
  Girl,
}

enum BabyStatus {
  Love,
  Happy,
  Smile,
  Sad,
  Cry,
}

enum BMIType {
  Height,
  Weight,
}

enum FoodType {
  Porridge,
  Milk,
  Meat,
  Fish,
  Egg,
  Green_Vegets,
  Red_Vegets,
  Citrus_Fruit,
}

enum NIType {
  Carbohydrate,
  Fat,
  Protein,
  Vitamin_A,
  Vitamin_B,
  Vitamin_C,
  Vitamin_D,
  Iron,
  Calcium,
  Iodine
}

enum MessageTypes {
  Own,
  Other,
}
