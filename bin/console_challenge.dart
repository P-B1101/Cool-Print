import 'package:console_challenge/main.dart' as console_challenge;
import 'dart:io';

void main(List<String> arguments) {
  print('Enter your custom message');
  final message = stdin.readLineSync();
  print('enter your custom animation duration');
  final animationDuration = int.tryParse(stdin.readLineSync() ?? '');
  // final message = 'Hello';
  final header = animationDuration == null
      ? 'duration is not valid. so i use default 25 millseconds value :)'
      : null;
  if (header != null) print('header');
  console_challenge.coolPrint(
    message ?? 'Null Value',
    animationDuration ?? 25,
    () {
      print('Finished :). Thanks for using this application.');
    },
    header,
  );
  // console_challenge.coolPrint(message);
}
