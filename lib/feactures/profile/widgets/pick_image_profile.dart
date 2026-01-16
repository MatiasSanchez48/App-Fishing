import 'dart:io';

import 'package:app_fishing/feactures/profile/bloc/bloc_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageProfile extends StatefulWidget {
  const PickImageProfile({super.key});

  @override
  State<PickImageProfile> createState() => _PickImageProfileState();
}

class _PickImageProfileState extends State<PickImageProfile> {
  ///
  final ImagePicker _picker = ImagePicker();

  /// PICK IMAGE
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      context.read<BlocProfile>().add(
        BlocProfileEventSaveDataProfile(imageXFile: pickedFile),
      );
    }
  }

  Future<void> _showPickerOptions() async {
    await showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take Photo'),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick from Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  await _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('Cancel'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  ImageProvider _imageProvider(String? avatarUrl, XFile? imageXFile) {
    ImageProvider imageProvider;

    if (imageXFile != null) {
      imageProvider = FileImage(File(imageXFile.path));
    } else if (avatarUrl != null && avatarUrl.isNotEmpty) {
      imageProvider = NetworkImage(avatarUrl);
    } else {
      imageProvider = const AssetImage('');
    }

    return imageProvider;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocProfile, BlocProfileState>(
      builder: (context, state) {
        return InkWell(
          onTap: _showPickerOptions,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              image: state.user?.avatarUrl != null || state.imageXFile != null
                  ? DecorationImage(
                      onError: (exception, stackTrace) => const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_outlined,
                              color: Colors.grey,
                              size: 50,
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Agregar imagen',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      fit: BoxFit.cover,
                      image: _imageProvider(
                        state.user?.avatarUrl,
                        state.imageXFile,
                      ),
                    )
                  : null,
            ),
            child: state.user?.avatarUrl == null && state.imageXFile == null
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                          size: 50,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Agregar imagen',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
