/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/todo_endpoint.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'toDo': _i2.ToDoEndpoint()
        ..initialize(
          server,
          'toDo',
          null,
        )
    };
    connectors['toDo'] = _i1.EndpointConnector(
      name: 'toDo',
      endpoint: endpoints['toDo']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['toDo'] as _i2.ToDoEndpoint).create(
            session,
            params['title'],
            params['description'],
          ),
        ),
        'markCompleted': _i1.MethodConnector(
          name: 'markCompleted',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['toDo'] as _i2.ToDoEndpoint).markCompleted(
            session,
            params['id'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['toDo'] as _i2.ToDoEndpoint).delete(
            session,
            params['id'],
          ),
        ),
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['toDo'] as _i2.ToDoEndpoint).getAll(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i3.Endpoints()..initializeEndpoints(server);
  }
}
