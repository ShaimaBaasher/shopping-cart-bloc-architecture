
import '../utils/typedaf.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  ResultProducts<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
  ResultProducts<Type> call();
}