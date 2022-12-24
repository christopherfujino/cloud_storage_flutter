import 'package:flutter/material.dart';
import 'package:gcloud/storage.dart';
import 'src/setup.dart';

Future<void> main() async {
  final client = await createStorageClient(prompt);
  runApp(MyApp(client: client));
}

// TODO implement in UI
void prompt(String link) {
  print('''
Please visit the following link to authenticate this app:

$link
''');
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.client,
  });

  final Storage client;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        client: client,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.client,
  });

  final String title;
  final Storage client;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String>? _buckets;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Foo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_buckets != null)
              Expanded(
                child: ListView(
                  children: _buckets!.map<Widget>((String name) {
                    return Center(child: Text(name));
                  }).toList(),
                ),
              ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _refresh,
                ),
                IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: _download,
                ),
                IconButton(
                  icon: const Icon(Icons.upload_file),
                  onPressed: _upload,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _download() => print('TODO: download');

  void _upload() => print('TODO: upload');

  void _refresh() {
    widget.client.listBucketNames().toList().then((List<String> names) {
      setState(() => _buckets = names);
    });
  }
}
