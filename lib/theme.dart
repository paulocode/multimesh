import 'package:flutter/material.dart';

const seedColor = Color(0x0067e491);

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
  useMaterial3: true,
);

final darkTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark),
  useMaterial3: true,
);
