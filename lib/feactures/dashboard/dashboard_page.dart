import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route.gr.dart';
import 'package:chat_flutter_supabase/extensions/extensions.dart';
import 'package:chat_flutter_supabase/feactures/dashboard/bloc/bloc_dashboard.dart';
import 'package:chat_flutter_supabase/feactures/home/bloc/bloc_home.dart';
import 'package:chat_flutter_supabase/feactures/message/bloc/bloc_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<AutoRouterState> dashboardTabsRouterKey =
      GlobalKey<AutoRouterState>();
  @override
  Widget build(BuildContext context) {
    final supabase = context.supabase;
    AutoRouter.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocDashboard>(
          create: (context) => BlocDashboard(),
        ),
        BlocProvider<BlocHome>(
          create: (context) => BlocHome(
            supabase: supabase,
          ),
        ),
        BlocProvider<BlocMessage>(
          create: (context) => BlocMessage(
            supabase: supabase,
          ),
        ),
      ],
      child: AutoTabsRouter(
        key: dashboardTabsRouterKey,
        // list of your tab routes
        // routes used here must be declared as children
        // routes of /dashboard
        routes: const [
          HomeRoute(),
          SocialRoute(),
          ProfileRoute(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          // the passed child is technically our animated selected-tab page
          child: child,
        ),
        builder: (context, child) {
          // obtain the scoped TabsRouter controller using context
          final tabsRouter = AutoTabsRouter.of(context);
          // Here we're building our Scaffold inside of AutoTabsRouter
          // to access the tabsRouter controller provided in this context
          //
          // alternatively, you could use a global key
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store_mall_directory_sharp),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
