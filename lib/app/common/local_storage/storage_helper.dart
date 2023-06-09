import 'storage.dart';
part "storage_keyword.dart";

class StorageHelper {
  ///---User Phone
  static Future<void> setUserPhone(String? phone) async => await Storage.saveValue(_StorageKeyword.userPhone, phone);
  static String? get getUserPhone => Storage.getValue<String>(_StorageKeyword.userPhone);

  ///---User is online
  static Future<void> setUserIsOnline(bool? isOnline) async => await Storage.saveValue(_StorageKeyword.userIsOnline, isOnline);
  static bool? get getUserIsOnline => Storage.getValue<bool>(_StorageKeyword.userIsOnline);

  ///---User push Token
  static Future<void> setUserPushToken(String? pushToken) async => await Storage.saveValue(_StorageKeyword.userPushToken, pushToken);
  static String? get getUserPushToken => Storage.getValue<String>(_StorageKeyword.userPushToken);

  ///---User Role
  static Future<void> setUserRole(String? role) async => await Storage.saveValue(_StorageKeyword.userRole, role);
  static String? get getUserRole => Storage.getValue<String>(_StorageKeyword.userRole);


  ///---User password
  static Future<void> setUserPassword(String? password) async => await Storage.saveValue(_StorageKeyword.userPassword, password);
  static String? get getUserPassword => Storage.getValue<String>(_StorageKeyword.userPassword);


  static get removeUserPhone async => await Storage.removeValue(_StorageKeyword.userPhone );
  static get removeUserPassword async => await Storage.removeValue(_StorageKeyword.userPassword );
  static get removeUserIsOnlineStatus async => await Storage.removeValue(_StorageKeyword.userIsOnline);
  static get removeUserPushToken async => await Storage.removeValue(_StorageKeyword.userPushToken);


  ///---Log out
  static Future<void> logout() async {
    removeUserPhone;
    removeUserPassword;
    removeUserIsOnlineStatus;
    removeUserPushToken;

  }
}
