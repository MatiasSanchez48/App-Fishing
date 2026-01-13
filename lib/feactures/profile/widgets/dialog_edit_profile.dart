import 'package:chat_flutter_supabase/feactures/create_event/widgets/widgets.dart';
import 'package:chat_flutter_supabase/feactures/profile/bloc/bloc_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogEditProfile extends StatefulWidget {
  const DialogEditProfile({super.key});

  @override
  State<DialogEditProfile> createState() => _DialogEditProfileState();
}

class _DialogEditProfileState extends State<DialogEditProfile> {
  ///
  final TextEditingController _controllerName = TextEditingController();

  ///
  final TextEditingController _controllerHandle = TextEditingController();

  ///
  final TextEditingController _controllerDescription = TextEditingController();

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerHandle.dispose();
    _controllerDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Text('Edit profile')),
            const SizedBox(height: 5),
            const Text('Name'),
            const SizedBox(height: 5),
            InputName(
              controllerName: _controllerName,
              onChanged: (v) => context.read<BlocProfile>().add(
                BlocProfileEventSaveDataProfile(name: v),
              ),
            ),
            const SizedBox(height: 5),
            const Text('@handle'),
            const SizedBox(height: 5),
            InputName(
              controllerName: _controllerHandle,
              onChanged: (v) => context.read<BlocProfile>().add(
                BlocProfileEventSaveDataProfile(handle: v),
              ),
              hintText: '@handle',
            ),
            const SizedBox(height: 5),
            const Text('Description'),
            const SizedBox(height: 5),
            InputName(
              controllerName: _controllerDescription,
              onChanged: (v) => context.read<BlocProfile>().add(
                BlocProfileEventSaveDataProfile(description: v),
              ),
              hintText: 'Description',
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 5),
                BlocBuilder<BlocProfile, BlocProfileState>(
                  builder: (context, state) {
                    return Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (!state.isNotEmpty) {
                            Navigator.of(context).pop();
                            return;
                          }
                          Navigator.of(context).pop();
                          context.read<BlocProfile>().add(
                            const BlocProfileEventEditProfile(),
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
