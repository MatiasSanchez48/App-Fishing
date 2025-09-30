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
  int _currentIndex = 0;

  Future<void> _changePage(int index) {
    setState(() => _currentIndex = index);
    return switch (index) {
      0 => context.router.push(const HomeRoute()),
      1 => context.router.push(const SocialRoute()),
      2 => context.router.push(const ProfileRoute()),
      _ => context.router.push(const HomeRoute()),
    };
  }

  @override
  Widget build(BuildContext context) {
    final supabase = context.supabase;

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
      child: AutoRouter(
        builder: (context, content) {
          return switch (context.router.current.name) {
            _ => Scaffold(
              body: content,
              bottomNavigationBar: CustomBottomBar(
                currentIndex: _currentIndex,
                onTabSelected: _changePage,
              ),
            ),
          };
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
  final int currentIndex;
  final void Function(int) onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
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
          _buildTabItem(
            icon: Icons.home,
            index: 0,
            title: 'Home',
          ),
          _buildTabItem(
            icon: Icons.store_mall_directory_sharp,
            index: 1,
            title: 'Social',
          ),
          _buildTabItem(
            icon: Icons.person,
            index: 2,
            title: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required int index,
    required String title,
  }) {
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
