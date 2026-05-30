import 'package:florestae_flutter/model/carbon_emission.dart';

const emissionAgro = CarbonEmission(
  source: 'Agropecuária',
  category: 'Agricultura',
  tonsCO2: 560000,
  year: '2024',
  description:
      'Emissões provenientes da criação de gado, cultivo de arroz e uso de fertilizantes nitrogenados.',
);

const emissionDesmatamento = CarbonEmission(
  source: 'Desmatamento',
  category: 'Uso do Solo',
  tonsCO2: 1200000,
  year: '2024',
  description:
      'Principal fonte de emissões no Brasil. Inclui queimadas para abertura de novas áreas agrícolas.',
);

const emissionEnergia = CarbonEmission(
  source: 'Energia Elétrica',
  category: 'Energia',
  tonsCO2: 230000,
  year: '2024',
  description:
      'Geração termelétrica a combustíveis fósseis em períodos de estiagem da matriz hídrica.',
);

const emissionTransporte = CarbonEmission(
  source: 'Transporte Rodoviário',
  category: 'Transporte',
  tonsCO2: 410000,
  year: '2024',
  description:
      'Frotas de caminhões e veículos leves movidos a diesel e gasolina nas principais rodovias.',
);

const emissionIndustria = CarbonEmission(
  source: 'Indústria',
  category: 'Indústria',
  tonsCO2: 185000,
  year: '2024',
  description:
      'Processos industriais como cimento, siderurgia e produção química.',
);

const emissionResiduos = CarbonEmission(
  source: 'Resíduos Sólidos',
  category: 'Resíduos',
  tonsCO2: 92000,
  year: '2024',
  description:
      'Decomposição de matéria orgânica em aterros sanitários e lixões a céu aberto.',
);

List<CarbonEmission> getAllEmissions() {
  return const [
    emissionDesmatamento,
    emissionAgro,
    emissionTransporte,
    emissionEnergia,
    emissionIndustria,
    emissionResiduos,
  ];
}

List<String> getAllCategories() {
  return const [
    'Todas',
    'Uso do Solo',
    'Agricultura',
    'Transporte',
    'Energia',
    'Indústria',
    'Resíduos',
  ];
}

List<CarbonEmission> getEmissionsByCategory(String category) {
  if (category == 'Todas') return getAllEmissions();
  return getAllEmissions()
      .where((e) => e.category == category)
      .toList();
}
