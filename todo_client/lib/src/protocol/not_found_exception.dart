/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class NotFoundException extends _i1.SerializableEntity
    implements _i1.SerializableException {
  NotFoundException._({required this.message});

  factory NotFoundException({required String message}) = _NotFoundExceptionImpl;

  factory NotFoundException.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return NotFoundException(
        message: serializationManager
            .deserialize<String>(jsonSerialization['message']));
  }

  String message;

  NotFoundException copyWith({String? message});
  @override
  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}

class _NotFoundExceptionImpl extends NotFoundException {
  _NotFoundExceptionImpl({required String message}) : super._(message: message);

  @override
  NotFoundException copyWith({String? message}) {
    return NotFoundException(message: message ?? this.message);
  }
}
