part of "extension.dart";

extension ConfigExtensions on WidgetRef {
  AppConfig get config {
    return watch(configProvider);
  }
}

extension ConfigRefExtension on Ref {
  AppConfig get config {
    return watch(configProvider);
  }
}
