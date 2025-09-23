import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route.gr.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route_guard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  final SupabaseClient supabase = Supabase.instance.client;

  @override
  List<AutoRoute> get routes => [
    // HomeScreen is generated as HomeRoute because
    // of the replaceInRouteName property
    AutoRoute(
      page: DashboardRoute.page,
      initial: true,
      path: '/',
      guards: [AuthGuard(supabase)],
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: 'home',
          initial: true,
        ),
        AutoRoute(
          page: MessageRoute.page,
          path: 'message/:id',
        ),
      ],
    ),

    /// TODO : Cambiar nombres son horribles algunas
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
  ];
}
