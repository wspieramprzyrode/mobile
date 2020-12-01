import 'package:hive/hive.dart';

extension BoxExtensions on Box {
  E getTyped<E>(dynamic key, {E defaultValue}) {
    return get(key, defaultValue: defaultValue) as E;
  }
}
