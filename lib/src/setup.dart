import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:gcloud/storage.dart';

Future<Storage> createStorageClient(void Function(String) prompt) async {
  final client = await auth.clientViaUserConsent(
    auth.ClientId(
      // client id
      '1084609207747-o0nh4v979vvlhg1n1i4e8dt9sku5pipi.apps.googleusercontent.com',
      // client secret (not really secret)
      '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',
    ),
    Storage.SCOPES,
    prompt,
  );

  // Instantiate objects to access Cloud Datastore, Cloud Storage
  // and Cloud Pub/Sub APIs.
  return Storage(client, 'chris-and-lexie');
}
