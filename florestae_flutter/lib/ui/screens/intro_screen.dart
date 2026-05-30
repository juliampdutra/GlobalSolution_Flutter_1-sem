import 'dart:async';
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

/// Duração de cada slide em segundos
const _slideDuration = 4;

class IntroScreen extends StatefulWidget {
  final VoidCallback onFinish;

  const IntroScreen({super.key, required this.onFinish});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  // Controle do temporizador
  Timer? _autoAdvanceTimer;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: _slideDuration),
    );
    _startTimer();
  }

  @override
  void dispose() {
    _autoAdvanceTimer?.cancel();
    _progressController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _autoAdvanceTimer?.cancel();
    _progressController.forward(from: 0);

    _autoAdvanceTimer = Timer(
      const Duration(seconds: _slideDuration),
      () {
        if (mounted) _next();
      },
    );
  }

  void _next() {
    if (currentIndex < _slides.length - 1) {
      setState(() {
        currentIndex++;
      });
      _startTimer();
    } else {
      widget.onFinish();
    }
  }

  void _back() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      _startTimer();
    }
  }

  void _goToSlide(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
      _startTimer();
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
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: slide.image != null
                    ? Image.asset(
                        slide.image!,
                        key: ValueKey('img_$currentIndex'),
                        width: 180,
                        height: 180,
                        fit: BoxFit.contain,
                      )
                    : Container(
                        key: ValueKey('icon_$currentIndex'),
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
              ),

              const SizedBox(height: 40),

              // Título
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  slide.title,
                  key: ValueKey('title_$currentIndex'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3E2F),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Descrição
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  slide.description,
                  key: ValueKey('desc_$currentIndex'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF6B7C6D),
                    height: 1.5,
                  ),
                ),
              ),

              const Spacer(),

              // Indicadores de página clicáveis
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_slides.length, (index) {
                  final isActive = currentIndex == index;
                  return GestureDetector(
                    onTap: () => _goToSlide(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: isActive ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color(0xFF4A7C59)
                            : const Color(0xFFB0BEC5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              // Barra de progresso do temporizador
              AnimatedBuilder(
                animation: _progressController,
                builder: (context, _) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: _progressController.value,
                      minHeight: 4,
                      backgroundColor: const Color(0xFFB0BEC5).withValues(alpha: 0.4),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF4A7C59),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

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