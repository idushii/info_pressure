import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class RecordInfo {
  final String uuid;
  final String dateTime;
  final String pressure1;
  final String pressure2;
  final String frequency;
  final String wellBeing;

  RecordInfo({
    @required this.uuid,
    @required this.dateTime,
    @required this.pressure1,
    @required this.pressure2,
    @required this.frequency,
    @required this.wellBeing,
  });

  factory RecordInfo.empty() {
    return RecordInfo(
      uuid: Uuid().v4(),
      dateTime: DateTime.now().toIso8601String(),
      pressure1: '',
      pressure2: '',
      frequency: '',
      wellBeing: '',
    );
  }

  copyWith({
    String uuid,
    String dateTime,
    String pressure1,
    String pressure2,
    String frequency,
    String wellBeing,
  }) {
    return new RecordInfo(
      uuid: uuid ?? this.uuid,
      dateTime: dateTime ?? this.dateTime,
      pressure1: pressure1 ?? this.pressure1,
      pressure2: pressure2 ?? this.pressure2,
      frequency: frequency ?? this.frequency,
      wellBeing: wellBeing ?? this.wellBeing,
    );
  }

  @override
  String toString() {
    return "$uuid,$dateTime;$pressure1;$pressure2;$frequency;$wellBeing";
  }

  static RecordInfo fromString(String string) {
    var texts = string.split(';');
    return new RecordInfo(
      uuid: texts[0],
      dateTime: texts[1],
      pressure1: texts[2],
      pressure2: texts[3],
      frequency: texts[4],
      wellBeing: texts[5],
    );
  }

  static List<String> toListString(List<RecordInfo> items) {
    return items.map((e) => e.toString()).toList();
  }

  static List<RecordInfo> fromListString(List<String> items) {
    return items.map((e) => RecordInfo.fromString(e)).toList();
  }
}
