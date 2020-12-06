part of 'main.dart';

class EdtPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EdtPage> {
  RecordInfo item = new RecordInfo(
    dateTime: DateTime.now().toIso8601String(),
    pressure1: '',
    pressure2: '',
    frequency: '',
    wellBeing: '',
  );

  final dateTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    dateTimeController.text = formatDateTime(item.dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить запись')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ddd'),
              TextField(
                readOnly: true,
                controller: dateTimeController,
                onChanged: (text) => item = item.copyWith(dateTime: text),
                decoration: InputDecoration(
                  hintText: 'Дата Время',
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

                  var resDateTime = date
                    .add(Duration(hours: time.hour, minutes: time.minute));

                  setState(() {
                    item =
                        item.copyWith(dateTime: resDateTime.toIso8601String());
                  });

                  dateTimeController.text = formatDateTime(resDateTime.toIso8601String());
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) => item = item.copyWith(pressure1: text),
                decoration: InputDecoration(
                  hintText: 'Давление 1',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) => item = item.copyWith(pressure2: text),
                decoration: InputDecoration(
                  hintText: 'Давление 2',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) => item = item.copyWith(frequency: text),
                decoration: InputDecoration(
                  hintText: 'Пульс',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) => item = item.copyWith(wellBeing: text),
                decoration: InputDecoration(
                  hintText: 'Самочувствтие',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          List<String> _texts = _prefs.getStringList('items') ?? [];
          List<RecordInfo> items = RecordInfo.fromListString(_texts);
          items.add(item);
          _prefs.setStringList('items', RecordInfo.toListString(items));
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
