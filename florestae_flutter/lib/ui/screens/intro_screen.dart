import 'package:flutter/material.dart';

class _IntroSlide {
  final IconData? icon;
  final String? image;
  final String title;
  final String description;

  const _IntroSlide({
    this.icon,
    this.image,
    required this.title,
    required this.description,
  });
}

const _slides = [
  _IntroSlide(
    image: 'assets/images/gs1.png',
    title: 'Bem-vindo ao Florestae',
    description: 'Monitoramento ambiental do Brasil em tempo real.',
  ),
  _IntroSlide(
    icon: Icons.satellite_alt,
    title: 'Monitoramento por satélite',
    description: 'Áreas de desmatamento atualizadas por satélite.',
  ),
  _IntroSlide(
    icon: Icons.co2,
    title: 'Emissões de carbono',
    description: 'Acompanhe as fontes de CO₂ por categoria.',
  ),
  _IntroSlide(
    icon: Icons.bar_chart,
    title: 'Dados por bioma',
    description: 'Filtre por Amazônia, Cerrado, Mata Atlântica e mais.',
  ),
];

class IntroScreen extends StatefulWidget {
  final VoidCallback onFinish;

  const IntroScreen({super.key, required this.onFinish});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;

  void _next() {
    if (currentIndex < _slides.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      widget.onFinish();
    }
  }

  void _back() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final slide = _slides[currentIndex];
    final isLast = currentIndex == _slides.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Imagem ou ícone
              if (slide.image != null)
                Image.asset(
                  slide.image!,
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                )
              else
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4A7C59).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    slide.icon,
                    size: 56,
                    color: const Color(0xFF4A7C59),
                  ),
                ),

              const SizedBox(height: 40),

              // Título
              Text(
                slide.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3E2F),
                ),
              ),

              const SizedBox(height: 16),

              // Descrição
              Text(
                slide.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF6B7C6D),
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Indicadores de página
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_slides.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentIndex == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? const Color(0xFF4A7C59)
                          : const Color(0xFFB0BEC5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 32),

              // Botões
              Row(
                children: [
                  if (currentIndex > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _back,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: Color(0xFF4A7C59)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(color: Color(0xFF4A7C59)),
                        ),
                      ),
                    ),
                  if (currentIndex > 0) const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A7C59),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(isLast ? 'Começar' : 'Próximo'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
