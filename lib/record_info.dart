part of 'main.dart';

class RecordInfo {
  final String dateTime;
  final String pressure1;
  final String pressure2;
  final String frequency;
  final String wellBeing;

  RecordInfo({
    @required this.dateTime,
    @required this.pressure1,
    @required this.pressure2,
    @required this.frequency,
    @required this.wellBeing,
  });

  copyWith({
    String dateTime,
    String pressure1,
    String pressure2,
    String frequency,
    String wellBeing,
  }) {
    return new RecordInfo(
      dateTime: dateTime ?? this.dateTime,
      pressure1: pressure1 ?? this.pressure1,
      pressure2: pressure2 ?? this.pressure2,
      frequency: frequency ?? this.frequency,
      wellBeing: wellBeing ?? this.wellBeing,
    );
  }

  @override
  String toString() {
    return "$dateTime;$pressure1;$pressure2;$frequency;$wellBeing";
  }

  static RecordInfo fromString(String string) {
    var texts = string.split(';');
    return new RecordInfo(
      dateTime: texts[0],
      pressure1: texts[1],
      pressure2: texts[2],
      frequency: texts[3],
      wellBeing: texts[4],
    );
  }

  static List<String> toListString(List<RecordInfo> items) {
    return items.map((e) => e.toString()).toList();
  }

  static List<RecordInfo> fromListString(List<String> items) {
    return items.map((e) => RecordInfo.fromString(e)).toList();
  }
}
