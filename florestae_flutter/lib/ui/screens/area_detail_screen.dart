import 'package:florestae_flutter/model/monitored_area.dart';
import 'package:florestae_flutter/ui/components/eco_detail_top_app_bar.dart';
import 'package:flutter/material.dart';

class AreaDetailScreen extends StatelessWidget {
  final MonitoredArea? area;
  final VoidCallback onBackClick;

  const AreaDetailScreen({
    super.key,
    this.area,
    required this.onBackClick,
  });

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
    return Scaffold(
      appBar: EcoDetailTopAppBar(
        title: 'Detalhes da Área',
        onBackClick: onBackClick,
      ),
      body: area == null
          ? const Center(child: Text('Área não encontrada'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome + status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          area!.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2D3E2F),
                              ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: _statusColor(area!.status)
                              .withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          area!.status,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _statusColor(area!.status),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    area!.biome,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: const Color(0xFF4A7C59),
                        ),
                  ),

                  const SizedBox(height: 24),

                  // Cards de estatísticas
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          icon: Icons.forest,
                          label: 'Desmatado',
                          value:
                              '${area!.deforestedHectares.toStringAsFixed(0)} ha',
                          color: const Color(0xFF4A7C59),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          icon: Icons.co2,
                          label: 'Emissões CO₂',
                          value:
                              '${(area!.carbonEmissionsTons / 1000).toStringAsFixed(0)}k t',
                          color: const Color(0xFF607D8B),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Descrição',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    area!.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withValues(alpha: 0.08),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Icon(icon, size: 28, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
