import 'package:hive/hive.dart';

initHiveAdapters() {
  // Hive.registerAdapter(AddressesModelAdapter());
}

initHiveBoxes() async {
  await Hive.openBox('tokens');
}