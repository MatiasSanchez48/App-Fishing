import 'package:app_fishing/repository/base_repository.dart';
import 'package:image_picker/image_picker.dart';

/// {@template RepositoryImages}
/// TODO: Add description.
/// {@endtemplate}
class RepositoryImages extends BaseRepository {
  /// {@macro RepositoryImages}
  const RepositoryImages({required super.supabase});

  /// Crea una imagen en el almacenamiento de Supabase y devuelve su URL publica
  Future<String> createImage(XFile imagen) async {
    try {
      final bytes = await imagen.readAsBytes();
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

      await supabase.storage.from('images').uploadBinary(fileName, bytes);

      final imageUrl = supabase.storage.from('images').getPublicUrl(fileName);

      return imageUrl;
    } catch (e) {
      rethrow;
    }
  }
}
