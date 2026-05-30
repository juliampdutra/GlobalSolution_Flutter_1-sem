import 'package:florestae_flutter/ui/components/app_logo.dart';
import 'package:flutter/material.dart';

class EcoTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const EcoTopAppBar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      title: const AppLogo(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
