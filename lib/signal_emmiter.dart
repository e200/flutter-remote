import 'dart:convert';
import 'dart:math';

import 'package:flutter_remote/lg_signal_codes.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'package:isolate_handler/isolate_handler.dart';
import 'package:riverpod/riverpod.dart';

IsolateHandler _isolates = IsolateHandler();

void _entryPoint(Map<String, dynamic> context) {
  final _messenger = HandledIsolate.initialize(context);

  _messenger.listen((pattern) {
    _emmit(pattern);
  });
}

void _emmit(String json) async {
  final _map = jsonDecode(json);

  await IrSensorPlugin.transmitString(pattern: _map['pattern']!);

  _isolates.kill(_map['isolate']!);
}

final signalEmmiter = Provider<SignalEmmiter>((ref) => LgRemoteSignalEmmiter());

abstract class SignalEmmiter {
  void turnOnOff();
  void home();
  void info();
  void navigateUp();
  void navigateDown();
  void navigateLeft();
  void navigateRight();
  void ok();
  void exit();
  void back();
  void volumeUp();
  void volumeDown();
  void mute();
  void nextChannel();
  void previousChannel();
  void backwards();
  void forward();
  void play();
  void pause();
  void red();
  void green();
  void yellow();
  void blue();
}

class LgRemoteSignalEmmiter implements SignalEmmiter {
  @override
  void backwards() {
    emmit(LgSignalCodes.fastBackward);
  }

  @override
  void forward() {
    emmit(LgSignalCodes.fastForward);
  }

  @override
  void home() {
    emmit(LgSignalCodes.home);
  }

  @override
  void info() {
    emmit(LgSignalCodes.info);
  }

  @override
  void mute() {
    emmit(LgSignalCodes.mute);
  }

  @override
  void navigateDown() {
    emmit(LgSignalCodes.navigateDown);
  }

  @override
  void navigateLeft() {
    emmit(LgSignalCodes.navigateLeft);
  }

  @override
  void navigateRight() {
    emmit(LgSignalCodes.navigateRight);
  }

  @override
  void navigateUp() {
    emmit(LgSignalCodes.navigateUp);
  }

  @override
  void nextChannel() {
    emmit(LgSignalCodes.channelUp);
  }

  @override
  void ok() {
    emmit(LgSignalCodes.ok);
  }

  @override
  void play() {
    emmit(LgSignalCodes.play);
  }

  @override
  void previousChannel() {
    emmit(LgSignalCodes.channelDown);
  }

  @override
  void pause() {
    emmit(LgSignalCodes.pause);
  }

  @override
  void turnOnOff() {
    emmit(LgSignalCodes.turnOnOff);
  }

  @override
  void volumeDown() {
    emmit(LgSignalCodes.volumeDown);
  }

  @override
  void volumeUp() {
    emmit(LgSignalCodes.volumeUp);
  }

  @override
  void back() {
    emmit(LgSignalCodes.back);
  }

  @override
  void exit() {
    emmit(LgSignalCodes.exit);
  }

  @override
  void blue() {
    emmit(LgSignalCodes.blue);
  }

  @override
  void green() {
    emmit(LgSignalCodes.green);
  }

  @override
  void red() {
    emmit(LgSignalCodes.red);
  }

  @override
  void yellow() {
    emmit(LgSignalCodes.yellow);
  }

  void emmit(String pattern) {
    final _isolateName = Random().nextInt(100).toString();

    _isolates = IsolateHandler();

    _isolates.spawn(
      _entryPoint,
      name: _isolateName,
      onInitialized: () => _isolates.send(
        jsonEncode({
          'isolate': _isolateName,
          'pattern': pattern,
        }),
        to: _isolateName,
      ),
    );
  }
}
