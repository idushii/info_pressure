part of 'record_cubit.dart';

class RecordState {
  final List<RecordInfo> items;
  final RecordInfo currentItem;

  RecordState({
    @required this.items,
    @required this.currentItem,
  });

  RecordState copyWith({
    List<RecordInfo> items,
    RecordInfo currentItem,
  }) =>
      RecordState(
        items: items ?? this.items,
        currentItem: currentItem ?? this.currentItem,
      );

  Map<String, dynamic> toMap() => {"items": items, "currentItem": currentItem};

  Map<String, dynamic> toJson() => {"items": items, "currentItem": currentItem};

  static RecordState fromJson(Map<String, dynamic> json) => RecordState(
        items: json['items'],
        currentItem: json['currentItem'],
      );

  String toString() => "RecordState[items=$items,currentItem=$currentItem]";
}
