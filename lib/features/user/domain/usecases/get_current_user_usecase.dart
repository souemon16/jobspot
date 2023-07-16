import 'package:jobspot/core/usecases/usecase.dart';
import 'package:jobspot/features/user/domain/entities/user_entity.dart';
import 'package:jobspot/features/user/domain/repositories/user_repository.dart';

class GetCurrentUserUseCase implements UseCase<void, UserEntity>{
  final UserRepository userRepository;

  GetCurrentUserUseCase({required this.userRepository});

  @override
  Future<void> call({UserEntity? params}) {
    return userRepository.getCurrentUser(params!);
  }

}