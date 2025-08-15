import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/enums.dart';
import 'package:task/core/network/firebase_helper.dart';
import 'package:task/core/services/local_storage_service.dart';
import 'package:task/feature/authentication/data/datasource/remote_data_source.dart';
import 'package:task/feature/authentication/data/repositories/auth_repo_implementation.dart';
import 'package:task/feature/authentication/domain/repositories/auth_repo.dart';
import 'package:task/feature/home/data/datasource/remote_data_source.dart';
import 'package:task/feature/home/data/repositories/home_repo_implementation.dart';
import 'package:task/feature/home/domain/repositories/home_repo.dart';
import 'package:task/feature/home/domain/usecase/signout_usecase.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';
import 'package:task/feature/home/domain/usecase/get_all_user_usecase.dart';
import 'package:task/feature/home/presentaion/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  late final HomeRemoteDataSource _homeRemoteDataSource;
  late final HomeRepo _homeRepo;
  late final GetAllUserUseCase _getAllUserUseCase;
  late final SignOutUseCase _signOutUseCase;

  HomeCubit():super(HomeState(user: LocalStorageService().getUser()??UserEntity(name: "name", email: "email", phone: "phone", gender: "gender"), users: [])){
    _homeRemoteDataSource = HomeRemoteDataSourceImplementation(firebaseHelper: FirebaseHelper());
    _homeRepo = HomeRepoImplementation(_homeRemoteDataSource);
    _getAllUserUseCase =GetAllUserUseCase(_homeRepo);
    _signOutUseCase =SignOutUseCase(_homeRepo);
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

  signOut()async{
    try{
      emit(state.copyWith(status: RequestState.loading));
      final response= await _signOutUseCase.call();
      LocalStorageService().setLoginStatus(false);
      response.fold((failure) {
        emit(state.copyWith(signOutStatus: RequestState.error));
      }, (r) {
        LocalStorageService().setLoginStatus(false);
        emit(state.copyWith(signOutStatus: RequestState.loaded));
      },);
    }catch(e){
      emit(state.copyWith(signOutStatus: RequestState.error));
    }
  }

}