// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:chat_flutter_supabase/feactures/auth/login/login_page.dart'
    as _i4;
import 'package:chat_flutter_supabase/feactures/auth/register/register_page.dart'
    as _i7;
import 'package:chat_flutter_supabase/feactures/auth/reset_password/reset_password_page.dart'
    as _i8;
import 'package:chat_flutter_supabase/feactures/create_event/create_event.dart'
    as _i1;
import 'package:chat_flutter_supabase/feactures/dashboard/dashboard_page.dart'
    as _i2;
import 'package:chat_flutter_supabase/feactures/home/home_page.dart' as _i3;
import 'package:chat_flutter_supabase/feactures/message/message_page.dart'
    as _i5;
import 'package:chat_flutter_supabase/feactures/profile/profile_page.dart'
    as _i6;
import 'package:chat_flutter_supabase/feactures/social/social_page.dart' as _i9;
import 'package:flutter/material.dart' as _i11;

/// generated route for
/// [_i1.CreateEventPage]
class CreateEventRoute extends _i10.PageRouteInfo<void> {
  const CreateEventRoute({List<_i10.PageRouteInfo>? children})
    : super(CreateEventRoute.name, initialChildren: children);

  static const String name = 'CreateEventRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.CreateEventPage();
    },
  );
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i10.PageRouteInfo<void> {
  const DashboardRoute({List<_i10.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.MessagePage]
class MessageRoute extends _i10.PageRouteInfo<MessageRouteArgs> {
  MessageRoute({
    required String idPerson,
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         MessageRoute.name,
         args: MessageRouteArgs(idPerson: idPerson, key: key),
         rawPathParams: {'id': idPerson},
         initialChildren: children,
       );

  static const String name = 'MessageRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<MessageRouteArgs>(
        orElse: () => MessageRouteArgs(idPerson: pathParams.getString('id')),
      );
      return _i5.MessagePage(idPerson: args.idPerson, key: args.key);
    },
  );
}

class MessageRouteArgs {
  const MessageRouteArgs({required this.idPerson, this.key});

  final String idPerson;

  final _i11.Key? key;

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
/// [_i6.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfilePage();
    },
  );
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute({List<_i10.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.RegisterPage();
    },
  );
}

/// generated route for
/// [_i8.ResetPasswordPage]
class ResetPasswordRoute extends _i10.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i10.PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.ResetPasswordPage();
    },
  );
}

/// generated route for
/// [_i9.SocialPage]
class SocialRoute extends _i10.PageRouteInfo<void> {
  const SocialRoute({List<_i10.PageRouteInfo>? children})
    : super(SocialRoute.name, initialChildren: children);

  static const String name = 'SocialRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SocialPage();
    },
  );
}
