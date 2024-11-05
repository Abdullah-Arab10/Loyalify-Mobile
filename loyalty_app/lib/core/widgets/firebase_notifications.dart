// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:loyalty_app/core/utils/app_prefs.dart';
// import 'package:loyalty_app/core/utils/service_locator.dart';

// class FireBaseNotifications {
  
//   final _fireBaseMessaging = FirebaseMessaging.instance;

//   final AppPreferences appPreferences = getIt.get<AppPreferences>();

//   Future<void> initNotifications() async {
//     await _fireBaseMessaging.requestPermission();
//     String? token = await _fireBaseMessaging.getToken();
//     appPreferences.setDeviceToken(token ?? '');
//     print('Token: $token');
//   }
// }
