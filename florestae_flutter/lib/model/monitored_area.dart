class MonitoredArea {
  final String name;
  final String biome;
  final double deforestedHectares;
  final double carbonEmissionsTons;
  final String status;
  final String description;

  const MonitoredArea({
    required this.name,
    required this.biome,
    required this.deforestedHectares,
    required this.carbonEmissionsTons,
    required this.status,
    required this.description,
  });
}
