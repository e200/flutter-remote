import 'package:flutter_remote/remote_codes/lg.dart';
import 'package:ir_sensor_plugin/ir_sensor_plugin.dart';
import 'package:riverpod/riverpod.dart';

final remoteSignalEmitter =
    Provider<RemoteSignalEmitter>((ref) => LgRemoteSignalEmitter());

abstract class RemoteSignalEmitter {
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
}

class LgRemoteSignalEmitter implements RemoteSignalEmitter {
  @override
  void backwards() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.fastBackward);
  }

  @override
  void forward() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.fastForward);
  }

  @override
  void home() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.home);
  }

  @override
  void info() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.info);
  }

  @override
  void mute() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.mute);
  }

  @override
  void navigateDown() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.navigateDown);
  }

  @override
  void navigateLeft() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.navigateLeft);
  }

  @override
  void navigateRight() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.navigateRight);
  }

  @override
  void navigateUp() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.navigateUp);
  }

  @override
  void nextChannel() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.channelUp);
  }

  @override
  void ok() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.ok);
  }

  @override
  void play() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.play);
  }

  @override
  void previousChannel() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.channelDown);
  }

  @override
  void pause() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.pause);
  }

  @override
  void turnOnOff() async {
    await IrSensorPlugin.transmitString(pattern: LgRemoteCode.turnOnOff);
  }

  @override
  void volumeDown() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.volumeDown);
  }

  @override
  void volumeUp() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.volumeUp);
  }

  @override
  void back() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.back);
  }

  @override
  void exit() {
    IrSensorPlugin.transmitString(pattern: LgRemoteCode.exit);
  }
}
