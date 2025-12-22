import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 30),
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 300,
                        child: Center(
                          child: Text(
                            'Ricardo Lozano',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
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
                            '@ricardo_pescador',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'CUENTA',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              _SettingsGroup(
                children: [
                  _ListTileCustom(
                    icon: Icons.person,
                    title: 'Editar Perfil',
                    onTap: () {},
                  ),
                  _ListTileCustom(
                    icon: Icons.lock_outlined,
                    title: 'Cambiar Contraseña',
                    onTap: () {},
                  ),
                  _ListTileCustom(
                    icon: Icons.anchor_outlined,
                    title: 'Preferencias de Pesca',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'NOTIFICACIONES',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              _SettingsGroup(
                children: [
                  _ListTileCustom(
                    icon: Icons.notifications_active_outlined,
                    title: 'Notificaciones Push',
                    onTap: () {},
                    onChanged: (v) {},
                  ),
                  _ListTileCustom(
                    icon: Icons.email_outlined,
                    title: 'Notificaciones por Email',
                    onTap: () {},
                    onChanged: (v) {},
                  ),
                  _ListTileCustom(
                    icon: Icons.campaign_outlined,
                    title: 'Alertas de salidas',
                    onTap: () {},
                    onChanged: (v) {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'PRIVACIDAD Y SEGURIDAD',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              _SettingsGroup(
                children: [
                  _ListTileCustom(
                    icon: Icons.remove_red_eye_outlined,
                    title: 'Notificaciones Push',
                    onTap: () {},
                  ),
                  _ListTileCustom(
                    icon: Icons.block,
                    title: 'Notificaciones por Email',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'AYUDA Y SOPORTE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              _SettingsGroup(
                children: [
                  _ListTileCustom(
                    icon: Icons.help_outline_outlined,
                    title: 'Preguntas frecuentes',
                    onTap: () {},
                  ),
                  _ListTileCustom(
                    icon: Icons.support_agent_outlined,
                    title: 'Contactar con soporte',
                    onTap: () {},
                  ),
                  _ListTileCustom(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Terminos y politica de privacidad',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  /// TODO : Navegar a la pantalla del perfil
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.red[800],
                        size: 30,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Cerrar Sesión',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Version de la app 0.0.1',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({
    required this.children,
  });
  final List<_ListTileCustom> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey[400]!,
          width: .7,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...children.asMap().entries.map((entry) {
            final index = entry.key;
            final child = entry.value;
            final isLast = index == children.length - 1;

            if (isLast) {
              return child;
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child,
                const Divider(
                  indent: 15,
                  endIndent: 15,
                  thickness: .5,
                  height: 0,
                  color: Colors.black45,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _ListTileCustom extends StatefulWidget {
  const _ListTileCustom({
    required this.title,
    required this.icon,
    this.onTap,
    this.onChanged,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final void Function(bool? v)? onChanged;

  @override
  State<_ListTileCustom> createState() => _ListTileCustomState();
}

class _ListTileCustomState extends State<_ListTileCustom> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onChanged != null) {
          setState(() => isSelected = !isSelected);
          widget.onChanged!(isSelected);
          return;
        }
        widget.onTap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[400],
              ),
              child: Icon(
                widget.icon,
                color: const Color(0xff2f5f65),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            if (widget.onChanged != null)
              Switch(
                activeThumbColor: Colors.white,
                activeTrackColor: Colors.blue,
                value: isSelected,
                onChanged: (v) {
                  setState(() => isSelected = v);
                  widget.onChanged!(v);
                },
              )
            else
              const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black54,
                size: 30,
              ),
          ],
        ),
      ),
    );
  }
}
