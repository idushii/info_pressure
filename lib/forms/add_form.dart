import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_pressure/format_date_time.dart';
import 'package:info_pressure/models/record_info.dart';
import 'package:info_pressure/state/record_cubit.dart';

final _formKey = GlobalKey<FormState>();

class AddForm extends StatefulWidget {
  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  RecordInfo item = RecordInfo.empty();

  final dateTimeController = TextEditingController();
  RecordCubit recordCubit;

  @override
  void initState() {
    super.initState();


    recordCubit = context.read<RecordCubit>();

    setState(() {
      item = recordCubit.state.currentItem;
      dateTimeController.text = formatDateTime(item.dateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            readOnly: true,
            controller: dateTimeController,
            onChanged: (text) => item = item.copyWith(dateTime: text),
            decoration: InputDecoration(
              labelText: 'Дата Время',
            ),
            onTap: () async {
              var date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2025),
              );

              var time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              var resDateTime =
                  date.add(Duration(hours: time.hour, minutes: time.minute));

              setState(() {
                item = item.copyWith(dateTime: resDateTime.toIso8601String());
              });

              dateTimeController.text =
                  formatDateTime(resDateTime.toIso8601String());

              recordCubit.updateCurrent(item);
            },
          ),
          TextFormField(
            initialValue: item.pressure1,
            keyboardType: TextInputType.number,
            onChanged: (text) {
              item = item.copyWith(pressure1: text);
              recordCubit.updateCurrent(item);
            },
            decoration: InputDecoration(
              labelText: 'Давление 1',
            ),
          ),
          TextFormField(
            initialValue: item.pressure1,
            keyboardType: TextInputType.number,
            onChanged: (text) {
              item = item.copyWith(pressure2: text);
              recordCubit.updateCurrent(item);
            },
            decoration: InputDecoration(
              labelText: 'Давление 2',
            ),
          ),
          TextFormField(
            initialValue: item.frequency,
            keyboardType: TextInputType.number,
            onChanged: (text) {
              item = item.copyWith(frequency: text);
              recordCubit.updateCurrent(item);
            },
            decoration: InputDecoration(
              labelText: 'Пульс',
            ),
          ),
          TextFormField(
            initialValue: item.wellBeing,
            keyboardType: TextInputType.number,
            onChanged: (text) {
              item = item.copyWith(wellBeing: text);
              recordCubit.updateCurrent(item);
            },
            decoration: InputDecoration(
              labelText: 'Самочувствтие',
            ),
          ),
        ],
      ),
    );
  }
}
