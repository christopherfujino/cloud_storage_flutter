import 'dart:io' as io;

import 'package:cloud_storage_flutter/src/setup.dart';

Future<void> main() async {
  final client = await createStorageClient((String message) {
    io.stdout.writeln('Please authenticate at the following website:\n');
    io.stdout.writeln(message);
  });

  final bucketNames = await client.listBucketNames().toList();
  print(bucketNames);
}
