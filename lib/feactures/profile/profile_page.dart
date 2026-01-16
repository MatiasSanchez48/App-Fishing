import 'package:auto_route/auto_route.dart';
import 'package:app_fishing/extensions/extensions.dart';
import 'package:app_fishing/feactures/auth/widgets/widget.dart';
import 'package:app_fishing/feactures/profile/bloc/bloc_profile.dart';
import 'package:app_fishing/feactures/profile/widgets/widgets.dart';
import 'package:app_fishing/feactures/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final supabase = context.supabase;

    return BlocProvider(
      create: (_) => BlocProfile(supabase: supabase)
        ..add(BlocProfileEventGetProfile(id: widget.id))
        ..add(BlocProfileEventGetMyEvents(id: widget.id)),
      child: SingleChildScrollView(
        child: ContentProfile(id: widget.id),
      ),
    );
  }
}

class ContentProfile extends StatelessWidget {
  const ContentProfile({
    required this.id,
    super.key,
  });

  ///
  final String id;

  ///
  void _dialogEditProfile(BuildContext context) => showDialog<void>(
    context: context,
    builder: (_) => BlocProvider.value(
      value: context.read<BlocProfile>(),
      child: const DialogEditProfile(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocProfile, BlocProfileState>(
      listener: (context, state) {
        if (state is BlocProfileStateLoadingEditProfile) {
          DialogLoading.showDialogLoading(context);
        }
        if (state is BlocProfileStateSuccessEditProfile) {
          Navigator.of(context, rootNavigator: true).pop();
          DialogSuccess(
            onOk: () => Navigator.of(context, rootNavigator: true).pop(),
            description: 'Perfil actualizado!',
          ).showDialogSuccess(context);
        }
      },

      child: Column(
        children: [
          const SizedBox(height: 5),
          AppbarCustom(
            title: 'Perfil',
            iconRight: Icons.edit_outlined,
            onPressed: () => _dialogEditProfile(context),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const FotoNameAndDescription(),
                const SizedBox(height: 10),
                ButtonChat(id: id),
                const SizedBox(height: 20),
                const InfoProfile(),
                const SizedBox(height: 20),
                const Publications(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
