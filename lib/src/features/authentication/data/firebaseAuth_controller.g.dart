// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebaseAuth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUserDataHash() => r'5188bb012cbe5b7c23a09b5c06abeed9ee1d9fae';

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

typedef FetchUserDataRef = AutoDisposeStreamProviderRef<UserModel>;

/// See also [fetchUserData].
@ProviderFor(fetchUserData)
const fetchUserDataProvider = FetchUserDataFamily();

/// See also [fetchUserData].
class FetchUserDataFamily extends Family<AsyncValue<UserModel>> {
  /// See also [fetchUserData].
  const FetchUserDataFamily();

  /// See also [fetchUserData].
  FetchUserDataProvider call(
    String uid,
  ) {
    return FetchUserDataProvider(
      uid,
    );
  }

  @override
  FetchUserDataProvider getProviderOverride(
    covariant FetchUserDataProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'fetchUserDataProvider';
}

/// See also [fetchUserData].
class FetchUserDataProvider extends AutoDisposeStreamProvider<UserModel> {
  /// See also [fetchUserData].
  FetchUserDataProvider(
    this.uid,
  ) : super.internal(
          (ref) => fetchUserData(
            ref,
            uid,
          ),
          from: fetchUserDataProvider,
          name: r'fetchUserDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUserDataHash,
          dependencies: FetchUserDataFamily._dependencies,
          allTransitiveDependencies:
              FetchUserDataFamily._allTransitiveDependencies,
        );

  final String uid;

  @override
  bool operator ==(Object other) {
    return other is FetchUserDataProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
