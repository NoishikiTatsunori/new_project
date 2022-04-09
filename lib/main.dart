import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(

        title: Text(ref.watch(titleProvider)),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              ref.watch(messageProvider)
            ),
            Text(
              ref.watch(countProvider).toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(_stateProvider.notifier).update((state) => state+1);
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}