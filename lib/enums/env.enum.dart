import 'package:json_annotation/json_annotation.dart';

// ANCHOR Env Key Enum
@JsonEnum()
enum EnvKeyEnum {
  @JsonValue('ENV_NAME')
  envName,

  @JsonValue('API_URL')
  apiUrl;
}
