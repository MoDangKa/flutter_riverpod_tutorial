// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCustomerHash() => r'23d0fad6741bb5dba655b187bbc32ee4f04a7d41';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchCustomer].
@ProviderFor(fetchCustomer)
const fetchCustomerProvider = FetchCustomerFamily();

/// See also [fetchCustomer].
class FetchCustomerFamily extends Family<AsyncValue<Customer>> {
  /// See also [fetchCustomer].
  const FetchCustomerFamily();

  /// See also [fetchCustomer].
  FetchCustomerProvider call({
    required String input,
    required int someValue,
    required bool secondValue,
  }) {
    return FetchCustomerProvider(
      input: input,
      someValue: someValue,
      secondValue: secondValue,
    );
  }

  @override
  FetchCustomerProvider getProviderOverride(
    covariant FetchCustomerProvider provider,
  ) {
    return call(
      input: provider.input,
      someValue: provider.someValue,
      secondValue: provider.secondValue,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchCustomerProvider';
}

/// See also [fetchCustomer].
class FetchCustomerProvider extends AutoDisposeFutureProvider<Customer> {
  /// See also [fetchCustomer].
  FetchCustomerProvider({
    required String input,
    required int someValue,
    required bool secondValue,
  }) : this._internal(
          (ref) => fetchCustomer(
            ref as FetchCustomerRef,
            input: input,
            someValue: someValue,
            secondValue: secondValue,
          ),
          from: fetchCustomerProvider,
          name: r'fetchCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCustomerHash,
          dependencies: FetchCustomerFamily._dependencies,
          allTransitiveDependencies:
              FetchCustomerFamily._allTransitiveDependencies,
          input: input,
          someValue: someValue,
          secondValue: secondValue,
        );

  FetchCustomerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.input,
    required this.someValue,
    required this.secondValue,
  }) : super.internal();

  final String input;
  final int someValue;
  final bool secondValue;

  @override
  Override overrideWith(
    FutureOr<Customer> Function(FetchCustomerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCustomerProvider._internal(
        (ref) => create(ref as FetchCustomerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        input: input,
        someValue: someValue,
        secondValue: secondValue,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Customer> createElement() {
    return _FetchCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCustomerProvider &&
        other.input == input &&
        other.someValue == someValue &&
        other.secondValue == secondValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, input.hashCode);
    hash = _SystemHash.combine(hash, someValue.hashCode);
    hash = _SystemHash.combine(hash, secondValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCustomerRef on AutoDisposeFutureProviderRef<Customer> {
  /// The parameter `input` of this provider.
  String get input;

  /// The parameter `someValue` of this provider.
  int get someValue;

  /// The parameter `secondValue` of this provider.
  bool get secondValue;
}

class _FetchCustomerProviderElement
    extends AutoDisposeFutureProviderElement<Customer> with FetchCustomerRef {
  _FetchCustomerProviderElement(super.provider);

  @override
  String get input => (origin as FetchCustomerProvider).input;
  @override
  int get someValue => (origin as FetchCustomerProvider).someValue;
  @override
  bool get secondValue => (origin as FetchCustomerProvider).secondValue;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
