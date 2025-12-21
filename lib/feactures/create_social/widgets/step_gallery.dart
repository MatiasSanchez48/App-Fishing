import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StepGallery extends StatefulWidget {
  const StepGallery({super.key});

  @override
  State<StepGallery> createState() => _StepGalleryState();
}

class _StepGalleryState extends State<StepGallery> {
  ///
  final ImagePicker _picker = ImagePicker();

  ///
  final List<XFile> _images = [];

  ///
  Future<void> _pickImage(ImageSource source) async {
    if (_images.length >= 3) return;

    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() => _images.add(pickedFile));
    }
  }

  ///
  void _removeImage(int index) {
    setState(() => _images.removeAt(index));
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
                title: const Text('Tomar foto'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Elegir desde galería'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: _images.length < 3 ? _showPickerOptions : null,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              image: _images.isNotEmpty
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
                          ? NetworkImage(_images[0].path)
                          : FileImage(File(_images[0].path)),
                    )
                  : null,
            ),
            child: _images.isEmpty
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
        ),
        const SizedBox(height: 20),
        const Text(
          'Preview',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _images.length < 3 ? _images.length + 1 : _images.length,
            itemBuilder: (context, index) {
              /// BOTON AGREGAR
              if (index == _images.length && _images.length < 3) {
                return GestureDetector(
                  onTap: _showPickerOptions,
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: const Icon(Icons.add, size: 40, color: Colors.grey),
                  ),
                );
              }

              /// IMAGEN
              final image = _images[index];

              return Stack(
                children: [
                  Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: kIsWeb
                            ? NetworkImage(image.path)
                            : FileImage(File(image.path)) as ImageProvider,
                      ),
                    ),
                  ),

                  /// BOTON ELIMINAR
                  Positioned(
                    top: 10,
                    right: 15,
                    child: GestureDetector(
                      onTap: () => _removeImage(index),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 15),

        Text(
          '${_images.length}/3 imágenes seleccionadas',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
