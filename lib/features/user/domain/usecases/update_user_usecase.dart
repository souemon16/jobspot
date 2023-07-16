import 'package:jobspot/core/usecases/usecase.dart';
import 'package:jobspot/features/user/domain/entities/user_entity.dart';
import 'package:jobspot/features/user/domain/repositories/user_repository.dart';

class UpdateUserUseCase implements UseCase<void, UserEntity>{
  final UserRepository userRepository;

  UpdateUserUseCase({required this.userRepository});

  @override
  Future<void> call({UserEntity? params}) {
    return userRepository.updateUser(params!);
  }

}