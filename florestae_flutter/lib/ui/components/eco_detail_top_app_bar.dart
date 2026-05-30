import 'package:flutter/material.dart';

class EcoDetailTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackClick;
  final List<Widget>? actions;

  const EcoDetailTopAppBar({
    super.key,
    required this.title,
    this.onBackClick,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      title: Text(title),
      leading: IconButton(
        onPressed: onBackClick ?? () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Voltar',
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
