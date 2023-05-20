import 'package:flutter/material.dart';

class BottomBarIconData {
  BottomBarIconData(
      {this.imagePath = '',
      this.index = 0,
      this.selectedImagePath = '',
      this.isSelected = false,
      this.animationController,
      this.description = ''});

  String imagePath;
  String selectedImagePath;
  String description;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<BottomBarIconData> tabIconsList = <BottomBarIconData>[
    BottomBarIconData(
        imagePath: 'assets/images/progress_trace/page_1.png',
        selectedImagePath: 'assets/images/progress_trace/page_1s.png',
        index: 0,
        isSelected: true,
        animationController: null,
        description: 'Daily'),
    BottomBarIconData(
        imagePath: 'assets/images/progress_trace/page_2.png',
        selectedImagePath: 'assets/images/progress_trace/page_2s.png',
        index: 1,
        isSelected: false,
        animationController: null,
        description: 'Last 7 Days'),
    BottomBarIconData(
        imagePath: 'assets/images/progress_trace/page_3.png',
        selectedImagePath: 'assets/images/progress_trace/page_3s.png',
        index: 2,
        isSelected: false,
        animationController: null,
        description: 'All Time'),
  ];
}
