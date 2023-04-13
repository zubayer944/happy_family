import 'storage.dart';
part "storage_keyword.dart";

class StorageHelper {
  ///---User Phone
  static Future<void> setUserPhone(String? phone) async => await Storage.saveValue(_StorageKeyword.userPhone, phone);
  static String? get getUserPhone => Storage.getValue<String>(_StorageKeyword.userPhone);

  ///---User Role
  static Future<void> setUserRole(String? role) async => await Storage.saveValue(_StorageKeyword.userRole, role);
  static String? get getUserRole => Storage.getValue<String>(_StorageKeyword.userRole);


  ///---User password
  static Future<void> setUserPassword(String? password) async => await Storage.saveValue(_StorageKeyword.userPassword, password);
  static String? get getUserPassword => Storage.getValue<String>(_StorageKeyword.userPassword);


  static get removeUserPhone async => await Storage.removeValue(_StorageKeyword.userPhone );
  static get removeUserPassword async => await Storage.removeValue(_StorageKeyword.userPassword );


  ///---Log out
  static Future<void> logout() async {
    removeUserPhone;
    removeUserPassword;
  }
}
