import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/core/network/firebase_helper.dart';
import 'package:task/core/services/local_storage_service.dart';
import 'package:task/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:task/feature/authentication/data/repositories/auth_repo_implementation.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';
import 'package:task/feature/home/domain/usecase/get_all_user_usecase.dart';
import 'package:task/feature/home/presentaion/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  late final AuthRemoteDataSource _authRemoteDataSource;
  late final AuthRepo _authRepo;
  late final GetAllUserUseCase _getAllUserUseCase;

  HomeCubit():super(HomeState(user: LocalStorageService().getUser()??UserEntity(name: "name", email: "email", phone: "phone", gender: "gender"), users: [])){
    _authRemoteDataSource = AuthRemoteDataSourceImplementation(firebaseHelper: FirebaseHelper());
    _authRepo = AuthRepoImplementation(_authRemoteDataSource);
    _getAllUserUseCase =GetAllUserUseCase(_authRepo);
  }

  getAllUsers()async{
    try{
      final response= await _getAllUserUseCase.call();
      await response.fold((failure) {
        final users=LocalStorageService().getUsers();
        emit(state.copyWith(status: RequestState.loaded,users: users));
      }, (users) async{
        await LocalStorageService().addUsers(users);
        emit(state.copyWith(users: users,status: RequestState.loaded));
      },);
    }catch(e){
      final users=LocalStorageService().getUsers();
      emit(state.copyWith(status: RequestState.loaded,users: users));
    }
  }

}