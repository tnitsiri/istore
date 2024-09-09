import 'package:json_annotation/json_annotation.dart';
import 'package:recase/recase.dart';

// ANCHOR Env Key Enum
@JsonEnum()
enum EnvKeyEnum {
  @JsonValue('ENV_NAME')
  envName,

  @JsonValue('API_URL')
  apiUrl;

  String key() {
    return name.constantCase;
  }
}
