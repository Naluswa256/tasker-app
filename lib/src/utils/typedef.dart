import 'package:fpdart/fpdart.dart';
import 'package:kuunganatask/src/exceptions/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
