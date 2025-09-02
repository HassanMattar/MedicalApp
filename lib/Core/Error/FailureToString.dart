import 'package:medical2/Core/Error/Failure.dart';

String mapFailureToMessage(Failure failure) {
  if (failure is NetworkFailure) return "تأكد من اتصالك بالانترنت";
  if (failure is UnexpectedFailure) return "هناك خطأ غير معروف";
  if (failure is InvalidEmailOrPasswordFailure) return "تأكد من أدخال البيانات بشكل صحيح";
  if (failure is ServerFailure) return "هناك خطأ في السيرفر";
    if (failure is DataErrorFailure) return "تأكد من أدخال البيانات بشكل صحيح";

  return "error";
}
