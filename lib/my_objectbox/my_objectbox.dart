// ignore_for_file: unnecessary_string_escapes, depend_on_referenced_packages
import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart' as path_provider;
import '../objectbox.g.dart';

class MyObjectbox {
  static late Store storee;
  static late Store saleStore;
  static Future<void> init() async {
    // final dir = await path_provider.getApplicationSupportDirectory();
    // storee = Store(
    //   getObjectBoxModel(),
    //   directory: path.join(
    //       "C:\\Users\\FlutterDev\\AppData\\Roaming\\com.example\\invan003",
    //       "invan_pos_objectbox_db"),
    // );

    saleStore = Store(
      getObjectBoxModel(),
      directory: path.join(
          "C:\\Users\\FlutterDev\\AppData\\Roaming\\com.example\\invan003",
          "sale_objectbox_db"),
    );
  }
}
