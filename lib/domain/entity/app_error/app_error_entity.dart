class AppErrorEntity {
  final String message;
  final bool isRecoverable;

  /// True when the failure is connectivity, not the backend — lets the UI show
  /// a "no internet" view with a retry instead of a server-error one.
  final bool isConnectivity;

  const AppErrorEntity({
    required this.message,
    this.isRecoverable = true,
    this.isConnectivity = false,
  });
}
