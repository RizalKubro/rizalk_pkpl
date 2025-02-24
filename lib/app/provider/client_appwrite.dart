import 'package:FLUTTERPROJECT/app/utils/appwrite_contants.dart';
import 'package:appwrite/appwrite.dart';

Client client = Client()
    .setEndpoint(AppwriteConstants.endPoint)
    .setProject(AppwriteConstants.projectId)
    .setSelfSigned(
        status: true);

Account account = Account(client);

Future<bool> checkUserAuth() async {
  try {
    
    await account.getSession(sessionId: 'current');
    return true;
  } catch (e) {
    return false;
  }
}


