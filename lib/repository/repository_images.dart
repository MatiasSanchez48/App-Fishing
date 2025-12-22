import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepositoryImages {
  RepositoryImages({
    required SupabaseClient supabase,
  }) : _supabase = supabase;

  final SupabaseClient _supabase;

  Future<String> crearPostConImagen(XFile imagen) async {
    final bytes = await imagen.readAsBytes();
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

    await _supabase.storage.from('images').uploadBinary(fileName, bytes);

    final imageUrl = _supabase.storage.from('images').getPublicUrl(fileName);

    return imageUrl;
  }
}
