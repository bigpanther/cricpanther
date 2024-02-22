import 'package:uuid/uuid.dart';

class UUID {
  static const Uuid _uuid = Uuid();
  static String uuid() => _uuid.v4();
}
