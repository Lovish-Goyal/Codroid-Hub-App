import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  /// * Appwrite Project Id
  @EnviedField(varName: 'projectId')
  static String projectId = _Env.projectId;

  /// * Appwrite Project Endpoint
  @EnviedField(varName: 'endpoint')
  static String endpoint = _Env.endpoint;

  /// * Appwrite course collection id
  @EnviedField(varName: 'courseCollectionId')
  static String courseCollectionId = _Env.courseCollectionId;

  /// * Appwrite database  id
  @EnviedField(varName: 'dataBaseId')
  static String dataBaseId = _Env.dataBaseId;

  @EnviedField(varName: 'userCollectionId')
  static String userCollectionId = _Env.userCollectionId;
}
