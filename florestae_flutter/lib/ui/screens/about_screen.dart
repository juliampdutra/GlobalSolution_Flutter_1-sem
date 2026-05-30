import 'package:florestae_flutter/ui/components/eco_detail_top_app_bar.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final VoidCallback onBackClick;

  const AboutScreen({super.key, required this.onBackClick});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcoDetailTopAppBar(
        title: 'Sobre o Florestae',
        onBackClick: onBackClick,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo central
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/gs1.png',
                    width: 96,
                    height: 96,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Florestae',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3E2F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Versão 1.0.0',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B7C6D),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            _SectionTitle(title: 'Sobre o Projeto'),
            const SizedBox(height: 8),
            const Text(
              'O Florestae é uma solução desenvolvida para o monitoramento de desmatamento e emissões de carbono no Brasil. '
              'Através de dados mockados de satélites e sensores ambientais, o app permite visualizar áreas críticas '
              'e acompanhar as principais fontes de emissão de CO₂ por categoria e bioma.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF4A4A4A),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            _SectionTitle(title: 'Funcionalidades'),
            const SizedBox(height: 8),
            _FeatureItem(
                icon: Icons.satellite_alt,
                text: 'Monitoramento de áreas desmatadas'),
            _FeatureItem(
                icon: Icons.filter_list,
                text: 'Filtro por bioma e categoria'),
            _FeatureItem(
                icon: Icons.co2,
                text: 'Rastreamento de emissões de CO₂'),
            _FeatureItem(
                icon: Icons.info_outline,
                text: 'Dados detalhados por área monitorada'),

            const SizedBox(height: 24),

            _SectionTitle(title: 'Desenvolvedores'),
            const SizedBox(height: 8),
            const Text(
              'RM 557645 • RM 554540',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF4A4A4A),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'FIAP — Global Solution 2026',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7C6D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2D3E2F),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _FeatureItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF4A7C59)),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: Color(0xFF4A4A4A)),
          ),
        ],
      ),
    );
  }
}
