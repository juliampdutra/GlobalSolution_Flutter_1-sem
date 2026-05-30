import 'package:florestae_flutter/model/monitored_area.dart';
import 'package:florestae_flutter/repository/monitored_area_repository.dart';
import 'package:florestae_flutter/ui/components/area_card.dart';
import 'package:florestae_flutter/ui/components/eco_top_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<MonitoredArea> onAreaClick;
  final VoidCallback onEmissionsClick;
  final VoidCallback onAboutClick;

  const HomeScreen({
    super.key,
    required this.onAreaClick,
    required this.onEmissionsClick,
    required this.onAboutClick,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<MonitoredArea> areasState;
  late List<String> biomesState;
  String selectedBiome = 'Todos';

  @override
  void initState() {
    super.initState();
    areasState = getAllMonitoredAreas();
    biomesState = getAllBiomes();
  }

  void _onBiomeSelected(String biome) {
    setState(() {
      selectedBiome = biome;
      areasState = getAreasByBiome(biome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcoTopAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: FilledButton.tonalIcon(
              onPressed: widget.onEmissionsClick,
              icon: const Icon(Icons.co2, size: 18),
              label: const Text('Carbono'),
              style: FilledButton.styleFrom(
                backgroundColor:
                    const Color(0xFF4A7C59).withValues(alpha: 0.12),
                foregroundColor: const Color(0xFF2D3E2F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: widget.onAboutClick,
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre',
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Filtro por bioma (lista horizontal)
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: biomesState.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final biome = biomesState[index];
                    final isSelected = biome == selectedBiome;
                    return GestureDetector(
                      onTap: () => _onBiomeSelected(biome),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF4A7C59)
                              : const Color(0xFFEEEEE8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          biome,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF4A4A4A),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'Áreas Monitoradas',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2D3E2F),
                    ),
              ),

              const SizedBox(height: 8),

              // Lista vertical de cards
              Expanded(
                child: areasState.isEmpty
                    ? const Center(child: Text('Nenhuma área encontrada'))
                    : ListView.builder(
                        itemCount: areasState.length,
                        itemBuilder: (context, index) {
                          final area = areasState[index];
                          return AreaCard(
                            area: area,
                            onClick: widget.onAreaClick,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
