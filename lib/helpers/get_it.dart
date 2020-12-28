import 'package:findadmissionaffiliate/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:findadmissionaffiliate/bloc/institutes/doc_fetch/doc_fetch_bloc.dart';
import 'package:findadmissionaffiliate/bloc/institutes/work_exp/work_exp_bloc.dart';
import 'package:findadmissionaffiliate/bloc/univ_filter_bloc/univ_filter_bloc.dart';
import 'package:findadmissionaffiliate/dto/institutes/selected_course.dart';
import 'package:findadmissionaffiliate/dto/loginpost.dart';
import 'package:findadmissionaffiliate/dto/signuppost.dart';
import 'package:findadmissionaffiliate/dto/students/funding_dto.dart';
import 'package:findadmissionaffiliate/dto/students/std_selected_course.dart';
import 'package:findadmissionaffiliate/repository/app_check_repo.dart';
import 'package:findadmissionaffiliate/repository/app_repo.dart';
import 'package:findadmissionaffiliate/repository/auth_repo.dart';
import 'package:findadmissionaffiliate/repository/setting_repo.dart';
import 'package:findadmissionaffiliate/repository/student_repo.dart';
import 'package:findadmissionaffiliate/repository/univ_repo.dart';
import 'package:findadmissionaffiliate/repository/user/menu/local_repo.dart';
import 'package:findadmissionaffiliate/repository/user_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:findadmissionaffiliate/repository/office_repo.dart';

GetIt getIt = GetIt.instance;

void setupLocator() async {
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(),
      signalsReady: true);
  getIt.registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(localLoginRepository: LocalLoginRepository()),
      signalsReady: true);

  getIt.registerLazySingleton<AppCheckRepo>(() => AppCheckRepo(),
      signalsReady: true);
  getIt.registerLazySingleton<SignUpPost>(() => SignUpPost(),
      signalsReady: true);
  getIt.registerLazySingleton<LoginPost>(() => LoginPost(), signalsReady: true);
  getIt.registerLazySingleton<LocalLoginRepository>(
      () => LocalLoginRepository(),
      signalsReady: true);
  getIt.registerLazySingleton<OfficeRepository>(() => OfficeRepository(), signalsReady: true);
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(), signalsReady: true);
  getIt.registerLazySingleton<StudentRepo>(() => StudentRepo(), signalsReady: true);
  getIt.registerLazySingleton<UnivFilterRepository>(() => UnivFilterRepository(), signalsReady: true);
  getIt.registerLazySingleton<UnivFilterBloc>(() => UnivFilterBloc(), signalsReady: true);
  getIt.registerLazySingleton<ApplicationRepo>(() => ApplicationRepo(), signalsReady: true);
  getIt.registerLazySingleton<DocFetchBloc>(() => DocFetchBloc(), signalsReady: true);
  getIt.registerLazySingleton<SelectedCourse>(() => SelectedCourse(), signalsReady: true);
  getIt.registerLazySingleton<StdSelectedCourse>(() => StdSelectedCourse(), signalsReady: true);
  getIt.registerLazySingleton<WorkExpBloc>(() => WorkExpBloc(), signalsReady: true);
  getIt.registerLazySingleton<StepTwoFundingDto>(() => StepTwoFundingDto(), signalsReady: true);
  getIt.registerLazySingleton<SettingRepo>(() => SettingRepo(), signalsReady: true);
}
