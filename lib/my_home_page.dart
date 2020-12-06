part of 'main.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<RecordInfo> items = [];

  SharedPreferences prefs;

  removeItem(RecordInfo item) async {
    final res = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Точно удалить?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Восстановить будет невозможно'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Удалить'),
              onPressed: () {
                Navigator.of(context).pop();
                final index = items.indexWhere((element) => element == item);
                setState(() {
                  items.removeAt(index);
                  prefs.setStringList('items', RecordInfo.toListString(items));
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    (() async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      List<String> _texts = _prefs.getStringList('items') ?? [];

      setState(() {
        prefs = _prefs;
        items = RecordInfo.fromListString(_texts);
      });
    })();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Статистика')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(2),
              3: FlexColumnWidth(1),
            },
            children: items.map((item) {
              return TableRow(children: [
                TableCell(
                  child: GestureDetector(
                    child: Text(formatDateTime(item.dateTime)),
                    onLongPress: () => removeItem(item),
                  ),
                ),
                TableCell(child: Text(item.pressure1)),
                TableCell(child: Text(item.pressure2)),
                TableCell(child: Text(item.frequency)),
                TableCell(child: Text(item.wellBeing)),
              ]);
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          List<String> _texts = prefs.getStringList('items') ?? [];

          setState(() {
            items = RecordInfo.fromListString(_texts);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
