part of '../main.dart';


class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  RecordCubit recordCubit;

  @override
  void initState() {
    super.initState();

    recordCubit = context.read<RecordCubit>();
    recordCubit.updateCurrent(RecordInfo.empty());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Добавить запись')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AddForm(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          recordCubit.add();
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
