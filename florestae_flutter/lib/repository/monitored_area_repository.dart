import 'package:florestae_flutter/model/monitored_area.dart';

const areaAmazonia1 = MonitoredArea(
  name: 'Pará - Região Sul',
  biome: 'Amazônia',
  deforestedHectares: 12400,
  carbonEmissionsTons: 310000,
  status: 'Crítico',
  description:
      'Área com alto índice de desmatamento ilegal, principalmente para expansão agropecuária. Monitoramento contínuo via satélite INPE.',
);

const areaAmazonia2 = MonitoredArea(
  name: 'Amazonas - Médio Rio',
  biome: 'Amazônia',
  deforestedHectares: 8750,
  carbonEmissionsTons: 218000,
  status: 'Alerta',
  description:
      'Região com pressão crescente de garimpos ilegais e queimadas. Área sob investigação federal.',
);

const areaCerrado1 = MonitoredArea(
  name: 'Mato Grosso - MATOPIBA',
  biome: 'Cerrado',
  deforestedHectares: 21300,
  carbonEmissionsTons: 425000,
  status: 'Crítico',
  description:
      'Fronteira agrícola com forte expansão de soja e milho. Um dos biomas mais ameaçados do Brasil.',
);

const areaCerrado2 = MonitoredArea(
  name: 'Goiás - Chapada dos Veadeiros',
  biome: 'Cerrado',
  deforestedHectares: 3200,
  carbonEmissionsTons: 64000,
  status: 'Moderado',
  description:
      'Região próxima à unidade de conservação. Pressão turística e agropecuária monitorada.',
);

const areaMataAtlantica1 = MonitoredArea(
  name: 'SP - Vale do Ribeira',
  biome: 'Mata Atlântica',
  deforestedHectares: 1850,
  carbonEmissionsTons: 37000,
  status: 'Moderado',
  description:
      'Um dos últimos remanescentes de Mata Atlântica. Ameaçado pelo avanço urbano e extração ilegal de madeira.',
);

const areaMataAtlantica2 = MonitoredArea(
  name: 'RJ - Serra dos Órgãos',
  biome: 'Mata Atlântica',
  deforestedHectares: 620,
  carbonEmissionsTons: 12400,
  status: 'Estável',
  description:
      'Área com boa cobertura de proteção legal. Monitoramento preventivo para evitar retrocesso.',
);

const areaPantanal = MonitoredArea(
  name: 'MS - Pantanal Norte',
  biome: 'Pantanal',
  deforestedHectares: 5400,
  carbonEmissionsTons: 108000,
  status: 'Alerta',
  description:
      'Maior planície alagável do mundo. Sofreu queimadas históricas em 2020 e está em recuperação.',
);

const areaCaatinga = MonitoredArea(
  name: 'BA - Sertão',
  biome: 'Caatinga',
  deforestedHectares: 4100,
  carbonEmissionsTons: 82000,
  status: 'Alerta',
  description:
      'Bioma exclusivamente brasileiro. Ameaçado pela expansão agropecuária e uso de lenha.',
);

List<MonitoredArea> getAllMonitoredAreas() {
  return const [
    areaAmazonia1,
    areaAmazonia2,
    areaCerrado1,
    areaCerrado2,
    areaMataAtlantica1,
    areaMataAtlantica2,
    areaPantanal,
    areaCaatinga,
  ];
}

List<String> getAllBiomes() {
  return const [
    'Todos',
    'Amazônia',
    'Cerrado',
    'Mata Atlântica',
    'Pantanal',
    'Caatinga',
  ];
}

List<MonitoredArea> getAreasByBiome(String biome) {
  if (biome == 'Todos') return getAllMonitoredAreas();
  return getAllMonitoredAreas()
      .where((area) => area.biome == biome)
      .toList();
}
