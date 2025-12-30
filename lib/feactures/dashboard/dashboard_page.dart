import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route.gr.dart';
import 'package:chat_flutter_supabase/extensions/extensions.dart';
import 'package:chat_flutter_supabase/feactures/create_event/bloc/bloc_create_event.dart';
import 'package:chat_flutter_supabase/feactures/dashboard/bloc/bloc_dashboard.dart';
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
  int _currentIndex = 0;
  Future<void> _changePage(int index) {
    setState(() => _currentIndex = index);

    return switch (index) {
      0 => context.router.replace(const HomeRoute()),
      1 => context.router.replace(const CreateEventRoute()),
      2 => context.router.replace(const SocialRoute()),
      3 => context.router.replace(
        ProfileRoute(
          id: context.supabase.auth.currentUser?.id ?? '',
        ),
      ),
      _ => context.router.replace(const HomeRoute()),
    };
  }

  // void _changeIndex(String name) async {
  //   return switch (name) {
  //     'Home' => setState(() => _currentIndex = 0),
  //     'CreateEvent' => setState(() => _currentIndex = 1),
  //     'Social' => setState(() => _currentIndex = 2),
  //     'Profile' => setState(() => _currentIndex = 3),
  //     _ => setState(() => _currentIndex = 0),
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    final supabase = context.supabase;

    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocDashboard>(
          create: (context) => BlocDashboard(),
        ),
        BlocProvider<BlocMessage>(
          create: (context) => BlocMessage(supabase: supabase),
        ),
        BlocProvider<BlocCreateEvent>(
          create: (context) => BlocCreateEvent(supabase: supabase),
        ),
      ],
      child: AutoRouter(
        builder: (context, content) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   _changeIndex(context.router.current.name);
          // });

          return SafeArea(
            child: Scaffold(
              body: content,
              bottomNavigationBar: CustomBottomBar(
                currentIndex: _currentIndex,
                onTabSelected: _changePage,
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    required this.currentIndex,
    required this.onTabSelected,
    super.key,
  });

  ///
  final int currentIndex;

  ///
  final void Function(int) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TabItem(
            icon: Icons.home,
            title: 'Home',
            index: 0,
            currentIndex: currentIndex,
            onTabSelected: onTabSelected,
          ),
          _TabItem(
            icon: Icons.add_box_outlined,
            title: 'New Event',
            index: 1,
            currentIndex: currentIndex,
            onTabSelected: onTabSelected,
          ),
          _TabItem(
            icon: Icons.store_mall_directory_sharp,
            title: 'Social',
            index: 2,
            currentIndex: currentIndex,
            onTabSelected: onTabSelected,
          ),
          _TabItem(
            icon: Icons.person,
            title: 'Profile',
            index: 3,
            currentIndex: currentIndex,
            onTabSelected: onTabSelected,
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.icon,
    required this.title,
    required this.index,
    required this.currentIndex,
    required this.onTabSelected,
  });
  final int currentIndex;

  ///
  final String title;

  ///
  final int index;

  ///
  final IconData icon;

  ///
  final void Function(int) onTabSelected;

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Icon(
              icon,
              size: isSelected ? 30 : 26,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey,
                fontSize: isSelected ? 16 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
