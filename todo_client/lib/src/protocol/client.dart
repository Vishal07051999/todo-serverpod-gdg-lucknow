/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:todo_client/src/protocol/todo.dart' as _i3;
import 'package:serverpod_auth_client/module.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointToDo extends _i1.EndpointRef {
  EndpointToDo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'toDo';

  _i2.Future<void> create(
    String title,
    String description,
  ) =>
      caller.callServerEndpoint<void>(
        'toDo',
        'create',
        {
          'title': title,
          'description': description,
        },
      );

  _i2.Future<void> markCompleted(int id) => caller.callServerEndpoint<void>(
        'toDo',
        'markCompleted',
        {'id': id},
      );

  _i2.Future<void> delete(int id) => caller.callServerEndpoint<void>(
        'toDo',
        'delete',
        {'id': id},
      );

  _i2.Future<List<_i3.ToDo>> getAll() =>
      caller.callServerEndpoint<List<_i3.ToDo>>(
        'toDo',
        'getAll',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i4.Caller(client);
  }

  late final _i4.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    toDo = EndpointToDo(this);
    modules = _Modules(this);
  }

  late final EndpointToDo toDo;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'toDo': toDo};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
