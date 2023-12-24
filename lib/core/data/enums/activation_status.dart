enum ActivationStatus {
  serverDisconnect,
  success,
  outNumberOfDevices,
  wrongApplicationID,
  wrongKey,
  none;

  factory ActivationStatus.getByIndex(int? index) => switch (index) {
        0 => serverDisconnect,
        1 => success,
        2 => outNumberOfDevices,
        3 => wrongApplicationID,
        4 => wrongKey,
        _ => none,
      };
}
