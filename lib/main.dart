import 'dart:async';
import 'dart:math';

coolPrint(
  String message,
  int animationDuration,
  Function() onFinish,
  String? header,
) async {
  String temp = '';
  int i = 0;
  bool breaker() => temp == message;
  _findLetter(message[i], animationDuration, breaker, onFinish)
      .listen((event) async {
    final isValid = temp.isEmpty
        ? message[i] == event
        : temp[temp.length - 1] == message[i];
    temp = isValid
        ? '$temp$event'
        : '${temp.substring(0, max(temp.length - 1, 0))}$event';
    _printMessage(temp, header);
    if (isValid) i++;
  });
}

Stream<String> _findLetter(
  String letter,
  int duration,
  bool Function() breaker,
  Function() onFinish,
) async* {
  int i = 'A'.codeUnitAt(0);
  while (true) {
    final result = String.fromCharCode(i);
    yield result;
    if (i == 'Z'.codeUnitAt(0)) {
      i = 'a'.codeUnitAt(0);
    } else if (i == 'z'.codeUnitAt(0)) {
      i = ' '.codeUnitAt(0);
    } else if (i == ' '.codeUnitAt(0)) {
      i = 'A'.codeUnitAt(0);
    } else {
      i++;
    }
    await _delay(duration);
    if (breaker()) {
      onFinish();
      break;
    }
  }
}

void _printMessage(String message, String? header) {
  _clearConsole();
  if (header != null) print(header);
  print(message);
}

void _clearConsole() => print('\x1B[2J\x1B[0;0H');

Future<void> _delay(int duration) =>
    Future.delayed(Duration(milliseconds: duration));
