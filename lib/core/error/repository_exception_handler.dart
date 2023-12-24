import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hitbitz/core/error/exception.dart';

import '../extensions/colorful_logging_extension.dart';
import 'failures.dart';

mixin RepositoryExceptionHandler {
  Future<Either<Failure, T>> exceptionHandler<T>({
    required Future<Either<Failure, T>> Function() tryCallRemote,
    Future<T?> Function()? tryCallLocal,
  }) async {
    try {
      final right = await tryCallRemote();
      return right;
    } on ServerException catch (e) {
      log("<< ServerException >> ".logRed);
      return Left(ServerFailure(message: e.message, code: e.statusCode));
    } on DuplicatedCartItemException catch (e) {
      log("<< DuplicatedCartItemException >> ".logRed);
      return Left(DuplicatedCartItemFailure(message: e.message, code: e.statusCode));
    } on EmptyCartException catch (e) {
      log("<< EmptyCartException >> ".logRed);
      return Left(EmptyCartFailure(message: e.message, code: e.statusCode));
    } on DuplicateInvoiceException catch (e) {
      log("<< DuplicateInvoiceException >> ".logRed);
      return Left(DuplicateInvoiceFailure(message: e.message, code: e.statusCode));
    } on NoVisitEventException catch (e) {
      log("<< NoVisitEventException >> ".logRed);
      return Left(NoVisitEventFailure(message: e.message, code: e.statusCode));
    } catch (e) {
      log("<< catch >> error is $e".logRed);
      return Left(UnknownFailure(message: e.toString()));

      // if (tryCallLocal != null) {
      //   final result = await tryCallLocal();
      //   if (result != null) {
      //     return Right(result);
      //   } else {
      //     return const Left(NoInternetFailure());
      //   }
      // } else {
      //   return const Left(NoInternetFailure());
      // }
    }
  }
}
