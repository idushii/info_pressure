import 'package:bloc/bloc.dart';
import 'package:info_pressure/models/record_info.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'record_state.dart';


class RecordCubit extends Cubit<RecordState> {
  RecordCubit()
      : super(RecordState(items: [], currentItem: RecordInfo.empty()));
  SharedPreferences _prefs;

  restore() async {
    _prefs = await SharedPreferences.getInstance();

    List<String> _texts = _prefs.getStringList('items') ?? [];

    emit(state.copyWith(items: RecordInfo.fromListString(_texts)));
  }

  updateCurrent(RecordInfo item) {
    emit(state.copyWith(currentItem: item));
  }

  add() {
    emit(state.copyWith(
        items: [...state.items, state.currentItem],
        currentItem: RecordInfo.empty()));

    _prefs.setStringList('items', RecordInfo.toListString(state.items));
  }

  update() {
    if (state.currentItem?.uuid != null) {
      emit(
        state.copyWith(
          items: state.items.map((e) {
            if (e.uuid == state.currentItem.uuid) {
              return state.currentItem;
            }
            return e;
          }).toList(),
          currentItem: RecordInfo.empty(),
        ),
      );

      _prefs.setStringList('items', RecordInfo.toListString(state.items));
    }
  }

  remove() {
    if (state.currentItem?.uuid != null) {
      emit(
        state.copyWith(
          items: state.items.where((e) {
            if (e.uuid == state.currentItem.uuid) {
              return false;
            }
            return true;
          }).toList(),
          currentItem: RecordInfo.empty(),
        ),
      );

      _prefs.setStringList('items', RecordInfo.toListString(state.items));
    }

  }
}
