import 'package:flutter/cupertino.dart';
import 'package:pokedex/constants/enums.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/main.dart';

Future<void> main() async {
  await setUpDependencies(BuildFlavor.PAID, Environment.TESTING);
  return runApp(MyApp());
}