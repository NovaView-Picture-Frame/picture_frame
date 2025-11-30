import 'dart:io';
import 'package:acanthis/acanthis.dart';
import 'package:yaml/yaml.dart';

final argsSchema = object({
  'CONFIG': string().notEmpty(),
});

final configSchema = object({
  'port': number().integer().gte(1024).lte(65535),
  'data_dir': string().notEmpty(),
});

class Config {
  static final Map<String, dynamic> _config = _load();
  static Map<String, dynamic> _load() {
    final args = argsSchema.parse(Platform.environment);
    final file = File(args.value['CONFIG']).readAsStringSync();
    final yaml = Map<String, dynamic>.from(loadYaml(file));
    return configSchema.parse(yaml).value;
  }

  static int get port => _config['port'];
  static String get dataDir => _config['data_dir'];
}
