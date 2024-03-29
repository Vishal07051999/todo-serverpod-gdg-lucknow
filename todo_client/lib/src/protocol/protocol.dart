/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'not_found_exception.dart' as _i2;
import 'todo.dart' as _i3;
import 'package:todo_client/src/protocol/todo.dart' as _i4;
import 'package:serverpod_auth_client/module.dart' as _i5;
export 'not_found_exception.dart';
export 'todo.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.NotFoundException) {
      return _i2.NotFoundException.fromJson(data, this) as T;
    }
    if (t == _i3.ToDo) {
      return _i3.ToDo.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.NotFoundException?>()) {
      return (data != null ? _i2.NotFoundException.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i3.ToDo?>()) {
      return (data != null ? _i3.ToDo.fromJson(data, this) : null) as T;
    }
    if (t == List<_i4.ToDo>) {
      return (data as List).map((e) => deserialize<_i4.ToDo>(e)).toList()
          as dynamic;
    }
    try {
      return _i5.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i5.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.NotFoundException) {
      return 'NotFoundException';
    }
    if (data is _i3.ToDo) {
      return 'ToDo';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i5.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'NotFoundException') {
      return deserialize<_i2.NotFoundException>(data['data']);
    }
    if (data['className'] == 'ToDo') {
      return deserialize<_i3.ToDo>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
