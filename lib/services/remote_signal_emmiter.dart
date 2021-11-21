import 'package:flutter_remote/remote_codes/lg.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'package:riverpod/riverpod.dart';

final remoteSignalEmmiter =
    Provider<RemoteSignalEmmiter>((ref) => LgRemoteSignalEmmiter());

abstract class RemoteSignalEmmiter {
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

class LgRemoteSignalEmmiter implements RemoteSignalEmmiter {
  @override
  void backwards() {
    emmit(LgRemoteCode.fastBackward);
  }

  @override
  void forward() {
    emmit(LgRemoteCode.fastForward);
  }

  @override
  void home() {
    emmit(LgRemoteCode.home);
  }

  @override
  void info() {
    emmit(LgRemoteCode.info);
  }

  @override
  void mute() {
    emmit(LgRemoteCode.mute);
  }

  @override
  void navigateDown() {
    emmit(LgRemoteCode.navigateDown);
  }

  @override
  void navigateLeft() {
    emmit(LgRemoteCode.navigateLeft);
  }

  @override
  void navigateRight() {
    emmit(LgRemoteCode.navigateRight);
  }

  @override
  void navigateUp() {
    emmit(LgRemoteCode.navigateUp);
  }

  @override
  void nextChannel() {
    emmit(LgRemoteCode.channelUp);
  }

  @override
  void ok() {
    emmit(LgRemoteCode.ok);
  }

  @override
  void play() {
    emmit(LgRemoteCode.play);
  }

  @override
  void previousChannel() {
    emmit(LgRemoteCode.channelDown);
  }

  @override
  void pause() {
    emmit(LgRemoteCode.pause);
  }

  @override
  void turnOnOff() {
    emmit(LgRemoteCode.turnOnOff);
  }

  @override
  void volumeDown() {
    emmit(LgRemoteCode.volumeDown);
  }

  @override
  void volumeUp() async {
    emmit(LgRemoteCode.volumeUp);
  }

  @override
  void back() {
    emmit(LgRemoteCode.back);
  }

  @override
  void exit() {
    emmit(LgRemoteCode.exit);
  }

  @override
  void blue() {
    emmit(LgRemoteCode.blue);
  }

  @override
  void green() {
    emmit(LgRemoteCode.green);
  }

  @override
  void red() {
    emmit(LgRemoteCode.red);
  }

  @override
  void yellow() {
    emmit(LgRemoteCode.yellow);
  }

  void emmit(String pattern) {
    IrSensorPlugin.transmitString(pattern: pattern);
  }
}
