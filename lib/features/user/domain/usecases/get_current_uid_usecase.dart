import 'package:jobspot/core/usecases/usecase.dart';
import 'package:jobspot/features/user/domain/repositories/user_repository.dart';

class GetCurrentUidUseCase implements UseCase {
  final UserRepository userRepository;

  GetCurrentUidUseCase({required this.userRepository});
  @override
  Future<void> call({params}) {
    return userRepository.getCurrentUid();
  } 
}
