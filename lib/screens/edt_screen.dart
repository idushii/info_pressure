part of '../main.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditScreen> {
  RecordCubit recordCubit;

  @override
  void initState() {
    super.initState();

    recordCubit = context.read<RecordCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Обновить запись'),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.delete),
            ),
            onTap: () async {
              var res = await removeItem(context, recordCubit.state.currentItem, recordCubit.remove);
              if (res) {
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AddForm(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          recordCubit.update();
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}

  removeItem(BuildContext context, RecordInfo item, VoidCallback remove) async {
    return await showDialog(
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
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Удалить'),
              onPressed: () {
                remove();
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

