import 'package:florestae_flutter/model/carbon_emission.dart';
import 'package:florestae_flutter/repository/carbon_emission_repository.dart';
import 'package:florestae_flutter/ui/components/eco_detail_top_app_bar.dart';
import 'package:florestae_flutter/ui/components/emission_card.dart';
import 'package:flutter/material.dart';

class EmissionsScreen extends StatefulWidget {
  final VoidCallback onBackClick;

  const EmissionsScreen({super.key, required this.onBackClick});

  @override
  State<EmissionsScreen> createState() => _EmissionsScreenState();
}

class _EmissionsScreenState extends State<EmissionsScreen> {
  late List<CarbonEmission> emissionsState;
  late List<String> categoriesState;
  String selectedCategory = 'Todas';

  @override
  void initState() {
    super.initState();
    emissionsState = getAllEmissions();
    categoriesState = getAllCategories();
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
      emissionsState = getEmissionsByCategory(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcoDetailTopAppBar(
        title: 'Emissões de Carbono',
        onBackClick: widget.onBackClick,
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

              // Filtro por categoria (lista horizontal)
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesState.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final category = categoriesState[index];
                    final isSelected = category == selectedCategory;
                    return GestureDetector(
                      onTap: () => _onCategorySelected(category),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF607D8B)
                              : const Color(0xFFEEEEE8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
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
                'Fontes de Emissão',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2D3E2F),
                    ),
              ),

              const SizedBox(height: 8),

              Expanded(
                child: emissionsState.isEmpty
                    ? const Center(child: Text('Nenhuma emissão encontrada'))
                    : ListView.builder(
                        itemCount: emissionsState.length,
                        itemBuilder: (context, index) {
                          final emission = emissionsState[index];
                          return EmissionCard(emission: emission);
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
