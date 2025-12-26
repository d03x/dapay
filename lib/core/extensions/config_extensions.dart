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

extension WidgetExt on Widget {
  SizedBox bR({double? size = 40}) {
    return SizedBox(height: size, child: this);
  }
}
