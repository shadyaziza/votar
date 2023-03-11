part of app_logger;

class StateObserver extends ProviderObserver {
  final TalkerLogger logger;

  StateObserver({required this.logger});
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.fine({
      'observer': 'didAddProvider',
      'providerName': provider.name,
      'currentValue': value,
    });
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    logger.good({
      'observer': 'didDisposeProvider',
      'providerName': provider.name,
    });
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.info({
      'observer': 'didUpdateProvider',
      'providerName': provider.name,
      'previousValue': previousValue,
      'newValue': newValue,
    });
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.critical({
      'observer': 'providerDidFail',
      'providerName': provider.name,
      'stackTrace': stackTrace,
      'error': error,
    });
  }
}
