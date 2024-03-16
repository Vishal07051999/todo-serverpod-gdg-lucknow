/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class ToDo extends _i1.TableRow {
  ToDo._({
    int? id,
    required this.uid,
    required this.title,
    required this.description,
    required this.completed,
  }) : super(id);

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

  static final t = ToDoTable();

  static const db = ToDoRepository._();

  int uid;

  String title;

  String description;

  bool completed;

  @override
  _i1.Table get table => t;

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

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'uid': uid,
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'uid':
        uid = value;
        return;
      case 'title':
        title = value;
        return;
      case 'description':
        description = value;
        return;
      case 'completed':
        completed = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<ToDo>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToDoTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ToDo>(
      where: where != null ? where(ToDo.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<ToDo?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToDoTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ToDo>(
      where: where != null ? where(ToDo.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<ToDo?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ToDo>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ToDoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ToDo>(
      where: where(ToDo.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    ToDo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    ToDo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    ToDo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToDoTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ToDo>(
      where: where != null ? where(ToDo.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static ToDoInclude include() {
    return ToDoInclude._();
  }

  static ToDoIncludeList includeList({
    _i1.WhereExpressionBuilder<ToDoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToDoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToDoTable>? orderByList,
    ToDoInclude? include,
  }) {
    return ToDoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ToDo.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ToDo.t),
      include: include,
    );
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

class ToDoTable extends _i1.Table {
  ToDoTable({super.tableRelation}) : super(tableName: 'todo') {
    uid = _i1.ColumnInt(
      'uid',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    completed = _i1.ColumnBool(
      'completed',
      this,
    );
  }

  late final _i1.ColumnInt uid;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnBool completed;

  @override
  List<_i1.Column> get columns => [
        id,
        uid,
        title,
        description,
        completed,
      ];
}

@Deprecated('Use ToDoTable.t instead.')
ToDoTable tToDo = ToDoTable();

class ToDoInclude extends _i1.IncludeObject {
  ToDoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ToDo.t;
}

class ToDoIncludeList extends _i1.IncludeList {
  ToDoIncludeList._({
    _i1.WhereExpressionBuilder<ToDoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ToDo.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ToDo.t;
}

class ToDoRepository {
  const ToDoRepository._();

  Future<List<ToDo>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToDoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ToDoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToDoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<ToDo>(
      where: where?.call(ToDo.t),
      orderBy: orderBy?.call(ToDo.t),
      orderByList: orderByList?.call(ToDo.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ToDo?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToDoTable>? where,
    int? offset,
    _i1.OrderByBuilder<ToDoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ToDoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<ToDo>(
      where: where?.call(ToDo.t),
      orderBy: orderBy?.call(ToDo.t),
      orderByList: orderByList?.call(ToDo.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ToDo?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<ToDo>(
      id,
      transaction: transaction,
    );
  }

  Future<List<ToDo>> insert(
    _i1.Session session,
    List<ToDo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<ToDo>(
      rows,
      transaction: transaction,
    );
  }

  Future<ToDo> insertRow(
    _i1.Session session,
    ToDo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<ToDo>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ToDo>> update(
    _i1.Session session,
    List<ToDo> rows, {
    _i1.ColumnSelections<ToDoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<ToDo>(
      rows,
      columns: columns?.call(ToDo.t),
      transaction: transaction,
    );
  }

  Future<ToDo> updateRow(
    _i1.Session session,
    ToDo row, {
    _i1.ColumnSelections<ToDoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<ToDo>(
      row,
      columns: columns?.call(ToDo.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<ToDo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<ToDo>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    ToDo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<ToDo>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ToDoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<ToDo>(
      where: where(ToDo.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ToDoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<ToDo>(
      where: where?.call(ToDo.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
