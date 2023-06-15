import '../../../app/deeplinking/deeplink.dart';

mixin SerializableEvent {
  String get args;

  @override
  String toString() {
    return '$runtimeType($args)';
  }
}

mixin ArglessEvent {
  String get args => '';
}

class PageReloaded with SerializableEvent, ArglessEvent {}

class PageBusyStateChanged with SerializableEvent {
  final bool busy;

  PageBusyStateChanged(this.busy);

  @override
  String get args => 'busy=$busy';
}

class UserBusyStateChanged with SerializableEvent {
  final bool busy;

  UserBusyStateChanged(this.busy);

  @override
  String get args => 'busy=$busy';
}

class AppStateChanged with SerializableEvent {
  final Object? initializationError;

  AppStateChanged._({required this.initializationError});

  factory AppStateChanged.changed() => AppStateChanged._(initializationError: null);
  factory AppStateChanged.initializationFailed(Object error) =>
      AppStateChanged._(initializationError: error);

  @override
  String get args => 'initializationError=$initializationError';
}

class AuthStateChanged with SerializableEvent {
  final dynamic session;

  AuthStateChanged._({required this.session});

  factory AuthStateChanged.loggedIn(session) => AuthStateChanged._(session: session);
  factory AuthStateChanged.loggedOut() => AuthStateChanged._(session: null);

  @override
  String get args => 'session=$session';
}

class UserDataChanged with SerializableEvent {
  final dynamic user;
  // final User user;

  UserDataChanged({required this.user});

  @override
  String get args => 'user=$user';
}

class DeeplinkLaunched with SerializableEvent {
  final Deeplink deeplink;

  DeeplinkLaunched({required this.deeplink});

  @override
  String get args => 'deeplink=$deeplink';
}

class RouteChanged with SerializableEvent {
  final String? route;

  RouteChanged(this.route);

  @override
  String get args => 'route=$route';
}

enum NetworkState { maintenance, authTokenExpired }

class NetworkStateChanged with SerializableEvent {
  final NetworkState state;

  NetworkStateChanged._(this.state);

  factory NetworkStateChanged.maintenance() => NetworkStateChanged._(NetworkState.maintenance);
  factory NetworkStateChanged.authTokenExpired() =>
      NetworkStateChanged._(NetworkState.authTokenExpired);

  @override
  String get args => 'state=$state';
}
