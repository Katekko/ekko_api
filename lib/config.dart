class Environments {
  static const String PRODUCTION = 'prod';
  static const String QAS = 'QAS';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

class ConfigEnvironments {
  static final String _currentEnvironments = Environments.LOCAL;
  static List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': '192.168.0.2',
    },
    {
      'env': Environments.DEV,
      'url': '0.0.0.0',
    },
    {
      'env': Environments.QAS,
      'url': '0.0.0.0',
    },
    {
      'env': Environments.PRODUCTION,
      'url': '0.0.0.0',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
