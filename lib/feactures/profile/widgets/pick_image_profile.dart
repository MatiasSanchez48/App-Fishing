import 'dart:io';

import 'package:chat_flutter_supabase/feactures/profile/bloc/bloc_profile.dart';
import 'package:flutter/foundation.dart';
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

  ///
  XFile? _image;

  /// PICK IMAGE
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() => _image = pickedFile);
      context.read<BlocProfile>().add(
        BlocProfileEventSaveDataProfile(imageUrl: _image),
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

  @override
  Widget build(BuildContext context) {
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
          image: _image != null
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
                          'Add Image',
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
                  image: kIsWeb
                      ? NetworkImage(_image!.path)
                      : FileImage(File(_image!.path)),
                )
              : null,
        ),
        child: _image == null
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
                      'Add Image',
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
  }
}
