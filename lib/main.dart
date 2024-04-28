import 'dart:io';

import 'cool_print.dart';

void main(List<String> arguments) {
  print('Enter your custom message');
  final message = stdin.readLineSync();
  print('enter your custom animation duration');
  final animationDuration = int.tryParse(stdin.readLineSync() ?? '');
  final header = animationDuration == null
      ? 'duration is not valid. so i use default 25 millseconds value :)'
      : null;
  if (header != null) print('header');
  CoolPrinter.coolPrint(
    message ?? 'Null Value',
    animationDuration ?? 25,
    () {
      print('Finished :). Thanks for using this application.');
    },
    header,
  );
}
