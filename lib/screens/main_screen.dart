part of '../main.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

const TextStyle th = TextStyle(fontWeight: FontWeight.bold);

class _MainScreenState extends State<MainScreen> {
  RecordCubit recordCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    recordCubit = context.read<RecordCubit>();
    recordCubit.restore();
  }

  getTh(String  text) {
    return TableCell(child: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: th),
    ));
  }

  getTd(String  text, item) {
    return TableCell(child: GestureDetector(
      onTap: () {
        recordCubit.updateCurrent(item);
        Navigator.pushNamed(context, '/edit');
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(text),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordCubit, RecordState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: Text('Мед статистика')),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    children: [
                      getTh('Дата'),
                      getTh('Давл 1'),
                      getTh('Давл 2'),
                      getTh('Пульс'),
                      getTh('Ощу'),
                    ],
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black, width: 1))
                    ),
                  ),
                  ...state.items.map((item) {
                    return TableRow(children: [
                        getTd(formatDateTime(item.dateTime), item),
                      getTd(item.pressure1, item),
                      getTd(item.pressure2, item),
                      getTd(item.frequency, item),
                      getTd(item.wellBeing, item),
                    ]);
                  }).toList()
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.pushNamed(context, '/add');
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
