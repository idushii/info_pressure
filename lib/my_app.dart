part of 'main.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => RecordCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Мед статистика',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainScreen(),
        routes: {
          '/add': (ctx) => AddScreen(),
          '/edit': (ctx) => EditScreen(),
          '/info': (ctx) => InfoScreen(),
        },
      ),
    );
  }
}
