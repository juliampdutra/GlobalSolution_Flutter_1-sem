import 'package:florestae_flutter/model/monitored_area.dart';
import 'package:flutter/material.dart';

class AreaCard extends StatelessWidget {
  final MonitoredArea area;
  final Function(MonitoredArea)? onClick;

  const AreaCard({super.key, required this.area, this.onClick});

  Color _statusColor(String status) {
    switch (status) {
      case 'Crítico':
        return const Color(0xFFB00020);
      case 'Alerta':
        return const Color(0xFFE65100);
      case 'Moderado':
        return const Color(0xFFF9A825);
      default:
        return const Color(0xFF388E3C);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: colors.outlineVariant, width: 1),
        ),
        child: InkWell(
          onTap: onClick != null ? () => onClick!(area) : null,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        area.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        area.biome,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.forest, size: 14, color: Color(0xFF4A7C59)),
                          const SizedBox(width: 4),
                          Text(
                            '${area.deforestedHectares.toStringAsFixed(0)} ha',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.co2, size: 14, color: Color(0xFF607D8B)),
                          const SizedBox(width: 4),
                          Text(
                            '${(area.carbonEmissionsTons / 1000).toStringAsFixed(0)}k t CO₂',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _statusColor(area.status).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        area.status,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _statusColor(area.status),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
