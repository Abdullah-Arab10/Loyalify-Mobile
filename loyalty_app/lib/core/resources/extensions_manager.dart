import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';

class Extensions {
  static int extractIdFromToken() {
    final AppPreferences appPreferences = getIt.get<AppPreferences>();
    int id = 1;
    appPreferences.getToken().then((value) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(value);
      id = decodedToken['Id'].hashCode;
    });
    return id;
  }

  static String extractRoleFromToken() {
    final AppPreferences appPreferences = getIt.get<AppPreferences>();
    String role = '';
    appPreferences.getToken().then((value) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(value);
      role = decodedToken['role'];
    });
    return role;
  }
}
