import 'package:dartz/dartz.dart';
import 'package:truetone/core/error/Failure.dart';

abstract class BaseHistoryRepo<Tfetch,Pramitarfetch,Tdelete,Pramitardelet>
{
 Future<Either<Failure,Tfetch>> fetch([Pramitarfetch pr]);
 Future<Either<Failure,Tdelete>>   delete([Pramitardelet pr]);
}
