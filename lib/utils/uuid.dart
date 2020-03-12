import 'package:uuid/uuid.dart';

class UUID {
  static Uuid _uuid = new Uuid();
  static String uuid() => _uuid.v4();
}
