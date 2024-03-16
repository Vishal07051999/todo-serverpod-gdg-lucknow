/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ToDo extends _i1.SerializableEntity {
  ToDo._({
    this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.completed,
  });

  factory ToDo({
    int? id,
    required int uid,
    required String title,
    required String description,
    required bool completed,
  }) = _ToDoImpl;

  factory ToDo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ToDo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uid: serializationManager.deserialize<int>(jsonSerialization['uid']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      completed: serializationManager
          .deserialize<bool>(jsonSerialization['completed']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int uid;

  String title;

  String description;

  bool completed;

  ToDo copyWith({
    int? id,
    int? uid,
    String? title,
    String? description,
    bool? completed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'title': title,
      'description': description,
      'completed': completed,
    };
  }
}

class _Undefined {}

class _ToDoImpl extends ToDo {
  _ToDoImpl({
    int? id,
    required int uid,
    required String title,
    required String description,
    required bool completed,
  }) : super._(
          id: id,
          uid: uid,
          title: title,
          description: description,
          completed: completed,
        );

  @override
  ToDo copyWith({
    Object? id = _Undefined,
    int? uid,
    String? title,
    String? description,
    bool? completed,
  }) {
    return ToDo(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}
