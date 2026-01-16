import 'package:app_fishing/feactures/profile/bloc/bloc_profile.dart';
import 'package:app_fishing/feactures/profile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FotoNameAndDescription extends StatelessWidget {
  const FotoNameAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocProfile, BlocProfileState>(
      builder: (context, state) {
        if (state is BlocProfileStateLoading || state.user == null) {
          return const CircularProgressIndicator();
        }
        return Column(
          children: [
            const PickImageProfile(),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  (state.user?.username ?? '').isEmpty
                      ? '...'
                      : state.user?.username ?? state.name ?? '...',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  (state.user?.handle ?? '').isEmpty
                      ? '@Handle'
                      : '@${state.user?.handle ?? state.handle ?? 'Handle_empty'}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(
                    (state.user?.description ?? '').isEmpty
                        ? 'Descripcion...'
                        : state.user?.description ??
                              state.description ??
                              'Descripcion...',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
