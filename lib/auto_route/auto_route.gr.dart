// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:chat_flutter_supabase/feactures/auth/login/login_page.dart'
    as _i5;
import 'package:chat_flutter_supabase/feactures/auth/register/register_page.dart'
    as _i8;
import 'package:chat_flutter_supabase/feactures/auth/reset_password/reset_password_page.dart'
    as _i9;
import 'package:chat_flutter_supabase/feactures/create_event/create_event.dart'
    as _i1;
import 'package:chat_flutter_supabase/feactures/dashboard/dashboard_page.dart'
    as _i2;
import 'package:chat_flutter_supabase/feactures/details_event/details_event_page.dart'
    as _i3;
import 'package:chat_flutter_supabase/feactures/home/home_page.dart' as _i4;
import 'package:chat_flutter_supabase/feactures/message/message_page.dart'
    as _i6;
import 'package:chat_flutter_supabase/feactures/profile/profile_page.dart'
    as _i7;
import 'package:chat_flutter_supabase/feactures/settings/settings_page.dart'
    as _i10;
import 'package:chat_flutter_supabase/feactures/social/social_page.dart'
    as _i11;
import 'package:flutter/material.dart' as _i13;

/// generated route for
/// [_i1.CreateEventPage]
class CreateEventRoute extends _i12.PageRouteInfo<void> {
  const CreateEventRoute({List<_i12.PageRouteInfo>? children})
    : super(CreateEventRoute.name, initialChildren: children);

  static const String name = 'CreateEventRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.CreateEventPage();
    },
  );
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute({List<_i12.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardPage();
    },
  );
}

/// generated route for
/// [_i3.DetailsEventPage]
class DetailsEventRoute extends _i12.PageRouteInfo<DetailsEventRouteArgs> {
  DetailsEventRoute({
    required String idEvent,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         DetailsEventRoute.name,
         args: DetailsEventRouteArgs(idEvent: idEvent, key: key),
         rawPathParams: {'id': idEvent},
         initialChildren: children,
       );

  static const String name = 'DetailsEventRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DetailsEventRouteArgs>(
        orElse: () =>
            DetailsEventRouteArgs(idEvent: pathParams.getString('id')),
      );
      return _i3.DetailsEventPage(idEvent: args.idEvent, key: args.key);
    },
  );
}

class DetailsEventRouteArgs {
  const DetailsEventRouteArgs({required this.idEvent, this.key});

  final String idEvent;

  final _i13.Key? key;

  @override
  String toString() {
    return 'DetailsEventRouteArgs{idEvent: $idEvent, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailsEventRouteArgs) return false;
    return idEvent == other.idEvent && key == other.key;
  }

  @override
  int get hashCode => idEvent.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.MessagePage]
class MessageRoute extends _i12.PageRouteInfo<MessageRouteArgs> {
  MessageRoute({
    required String idPerson,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         MessageRoute.name,
         args: MessageRouteArgs(idPerson: idPerson, key: key),
         rawPathParams: {'id': idPerson},
         initialChildren: children,
       );

  static const String name = 'MessageRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<MessageRouteArgs>(
        orElse: () => MessageRouteArgs(idPerson: pathParams.getString('id')),
      );
      return _i6.MessagePage(idPerson: args.idPerson, key: args.key);
    },
  );
}

class MessageRouteArgs {
  const MessageRouteArgs({required this.idPerson, this.key});

  final String idPerson;

  final _i13.Key? key;

  @override
  String toString() {
    return 'MessageRouteArgs{idPerson: $idPerson, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MessageRouteArgs) return false;
    return idPerson == other.idPerson && key == other.key;
  }

  @override
  int get hashCode => idPerson.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfilePage();
    },
  );
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.RegisterPage();
    },
  );
}

/// generated route for
/// [_i9.ResetPasswordPage]
class ResetPasswordRoute extends _i12.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i12.PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.ResetPasswordPage();
    },
  );
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute({List<_i12.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.SettingsPage();
    },
  );
}

/// generated route for
/// [_i11.SocialPage]
class SocialRoute extends _i12.PageRouteInfo<void> {
  const SocialRoute({List<_i12.PageRouteInfo>? children})
    : super(SocialRoute.name, initialChildren: children);

  static const String name = 'SocialRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.SocialPage();
    },
  );
}
