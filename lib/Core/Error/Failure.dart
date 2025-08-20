abstract class Failure {}

class ServerFailure extends Failure {}

class InvalidEmailOrPasswordFailure extends Failure {}
class DataErrorFailure extends Failure {}

class NetworkFailure extends Failure {}

class UnexpectedFailure extends Failure {}

