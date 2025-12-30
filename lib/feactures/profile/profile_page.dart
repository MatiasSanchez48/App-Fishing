import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/feactures/profile/widgets/widgets.dart';
import 'package:chat_flutter_supabase/feactures/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({
    @PathParam('id') required this.id,
    super.key,
  });

  /// id del usuario
  final String id;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 5),
          AppbarCustom(
            title: 'Profile',
            iconRight: Icons.settings_outlined,
            onPressed: () {},
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 30),
                FotoNameAndDescription(),
                SizedBox(height: 10),
                ButtonsFollowAndChat(),
                SizedBox(height: 20),
                InfoProfile(),
                SizedBox(height: 20),
                Publications(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
