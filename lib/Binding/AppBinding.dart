import 'package:get/get.dart';
import 'package:medical2/SettingService.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/usecases/AddFilesUseCase.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/usecases/GetFilesUseCase.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/domain/usecases/GetMedicalDataUseCase.dart';
import 'package:medical2/features/featureForPatient/%20PatientDetails/presentation/Controller/personalInfoController.dart';
import 'package:medical2/features/Auth/data/repositories/RepositoryImpl.dart';
import 'package:medical2/features/Auth/domain/usecases/ChangePasswordUseCase.dart';
import 'package:medical2/features/Auth/domain/usecases/LoginUseCase.dart';
import 'package:medical2/features/Auth/domain/usecases/SignUpUseCase.dart';
import 'package:medical2/features/Auth/presentation/Controller/AuthController/OTP_Controller.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/usecases/GetAllDoctorUseCase.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/usecases/GetAllFavoriteDoctorUseCase.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/usecases/RemoveFavoriteUseCase.dart';
import 'package:medical2/features/featureForPatient/DoctorInPatient/domain/usecases/UpDateRatingUseCase.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/data/datasources/RemoteDataSourceAppointmentInPatient.dart'
    show
        RemoteDataSourceAppointmentInPatientImpl,
        RemoteDataSourceAppointmentInPatient;
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/usecases/BookingAppointmentUseCase.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/domain/usecases/GetPreviousAppointmentsUseCase.dart';
import 'package:medical2/features/featureForPatient/PatientAppointment/presentation/Controller/BookingAppointmentController.dart';
import 'package:medical2/features/featureForPatient/SugarMuserment/data/datasources/SugarMeasurementRemoteDataSource.dart'
    show SugarMeasurementRemoteDataSource, SugarMeasurementRemoteDataSourceImpl;
import 'package:medical2/features/featureForPatient/SugarMuserment/data/repositories/SugarMeasurementRepositoryImpl.dart';
import 'package:medical2/features/featureForPatient/SugarMuserment/domain/usecases/AddSugarMuserUseCase.dart';
import 'package:medical2/features/featuresForDoctor/DoctorAppointments/presentation/Controller/AddNewAppointmentController.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/repositories/DoctorDetailRepository.dart';
import 'package:medical2/features/featuresForDoctor/DoctorDetails/domain/usecase/UpdateDoctorInfoUseCase.dart';

import '../Core/TokenService/TokenService.dart';
import '../features/featureForPatient/ PatientDetails/data/datasources/PatientDetailsRemoteDataSource.dart';
import '../features/featureForPatient/ PatientDetails/data/repositories/PatientDetailsRepositoryImpl.dart';
import '../features/featureForPatient/ PatientDetails/domain/repositories/PatientDetailsRepository.dart';
import '../features/featureForPatient/ PatientDetails/domain/usecases/GetMedicalHistoryUseCase.dart';
import '../features/featureForPatient/ PatientDetails/domain/usecases/GetPersonalInfoUseCase.dart';
import '../features/featureForPatient/ PatientDetails/domain/usecases/UpdateMedicalDataUseCase.dart';
import '../features/featureForPatient/ PatientDetails/domain/usecases/UpdatePersonalInformationUseCase.dart';
import '../features/featureForPatient/ PatientDetails/presentation/Controller/MedicalDataController.dart';
import '../features/featureForPatient/ PatientDetails/presentation/Controller/MedicalHistoryController.dart';
import '../features/Auth/data/datasources/RemoteDataSource.dart';
import '../features/Auth/domain/repositories/Repository.dart';
import '../features/Auth/presentation/Controller/AuthController/ForgetPasswordController.dart';
import '../features/Auth/presentation/Controller/AuthController/LoginController.dart';
import '../features/Auth/presentation/Controller/AuthController/NewPasswordController.dart';
import '../features/Auth/presentation/Controller/AuthController/SignUpController.dart';
import '../features/Auth/presentation/Controller/AuthController/OnBoardingController.dart';
import '../features/Auth/presentation/Controller/AuthController/SignUpFirstController.dart';
import '../features/featureForPatient/DoctorInPatient/data/datasources/DoctorInPatientRemoteDataSource.dart';
import '../features/featureForPatient/DoctorInPatient/data/repositories/DoctorInPatientRepositoryImpl.dart';
import '../features/featureForPatient/DoctorInPatient/domain/usecases/AddFavoriteUseCase.dart';
import '../features/featureForPatient/DoctorInPatient/presentation/Controller/DoctorScreenController.dart';
import '../features/featureForPatient/DoctorInPatient/presentation/Controller/ShowDoctorsController.dart';
import '../features/featureForPatient/PatientAppointment/data/repositories/AppointmentRepositoryImpl.dart';
import '../features/featureForPatient/PatientAppointment/domain/repositories/AppointmentRepository.dart';
import '../features/featureForPatient/PatientAppointment/domain/usecases/GetUpComingAppointmentsUseCase.dart';
import '../features/featureForPatient/PatientAppointment/presentation/Controller/AppointmentController.dart';
import '../features/featureForPatient/SugarMuserment/domain/repositories/SugerMusermentRepository.dart';
import '../features/featureForPatient/SugarMuserment/presentation/Controller/SugarMeasurementController.dart';
import '../features/featuresForDoctor/DoctorAppointments/data/datasources/DoctorAppointmentRemoteDataSource.dart';
import '../features/featuresForDoctor/DoctorAppointments/data/repositories/DoctorAppointmentRepositoryImpl.dart';
import '../features/featuresForDoctor/DoctorAppointments/domain/repositories/DoctorAppointmentRepository.dart';
import '../features/featuresForDoctor/DoctorAppointments/domain/usecases/AddNewAppointmentUseCase.dart';
import '../features/featuresForDoctor/DoctorAppointments/domain/usecases/GetAppointmentUseCase.dart';
import '../features/featuresForDoctor/DoctorAppointments/presentation/Controller/AppointmentController.dart';
import '../features/featuresForDoctor/DoctorDetails/data/datasources/DoctorDetailRemoteDataSource.dart';
import '../features/featuresForDoctor/DoctorDetails/data/repositories/DoctorDetailRepositoryImpl.dart';
import '../features/featuresForDoctor/DoctorDetails/domain/usecase/GetDoctorInfoUseCase.dart';
import '../features/featuresForDoctor/DoctorDetails/domain/usecase/GetMyPatientUseCase.dart';
import '../features/featuresForDoctor/DoctorDetails/presentation/Controller/DoctorMyInfoController.dart';
import '../features/featuresForDoctor/DoctorDetails/presentation/Controller/MyPatientListController.dart';

class AppBinding extends Bindings {
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => SignUpFirstController());
    Get.lazyPut(() => ForgetMyPasswordController());

    //** Core Binding*/
    Get.lazyPut<TokenService>(() => TokenService(),fenix: true);

    //** ___________________________________Auth Feature_______________________________________    */

    ///***************AuthRepositoryImpl************* */

    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    );

    ///*** for it*** */
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        networkInfo: Get.find<SettingServices>().networkInfo,
        remoteDataSource: Get.find(),
        tokenService: Get.find(),
      ),
    );

    ///***************LoginUseCase && SignUpUseCase******************** */

    Get.lazyPut<LoginUseCase>(() => LoginUseCase(repository: Get.find()));
    Get.lazyPut<SignUpUseCase>(() => SignUpUseCase(repository: Get.find()));
    Get.lazyPut<ChangePasswordUseCase>(
      () => ChangePasswordUseCase(repository: Get.find()),
    );

    ///**********************SignUpController && LoginController********************************* */

    Get.lazyPut<LoginController>(
      () => LoginController(loginUseCase: Get.find<LoginUseCase>(),),
      fenix: true
      
    );
    Get.lazyPut<SignUpController>(
      () => SignUpController(signUpUseCase: Get.find<SignUpUseCase>()),
      fenix: true
    );
    Get.lazyPut<NewPasswordController>(
      () => NewPasswordController(
        changePasswordUseCase: Get.find<ChangePasswordUseCase>(),
     
      ),
         fenix: true
    );

    //** ___________________________________PatientDetails Feature_______________________________________    */

    //**PatientDetailsRemoteDataSource */
    Get.lazyPut<PatientDetailsRemoteDataSource>(
      () => PatientDetailsRemoteDataSourceImpl(
      
      ),
    fenix: true
    );

    //**PatientDetailsRepository */
    Get.lazyPut<PatientDetailsRepository>(
      () => PatientDetailsRepositoryImpl(
        networkInfo: Get.find<SettingServices>().networkInfo,
        remoteDataSource: Get.find(),
        tokenService: Get.find(),
      ), fenix: true
    );

    //**   GetMedicalHistoryUseCase && UpdatePersonalInformationUseCase */
    Get.lazyPut<GetMedicalHistoryUseCase>(
      () => GetMedicalHistoryUseCase(
        repository: Get.find(),
        
      ),
      fenix: true
    );
    Get.lazyPut<UpdatePersonalInformationUseCase>(
      () => UpdatePersonalInformationUseCase(
        repository: Get.find(),
      ),
       fenix: true
    );

    Get.lazyPut<UpdateMedicalDataUseCase>(
      () => UpdateMedicalDataUseCase(
        repository: Get.find<PatientDetailsRepository>(),
      ),
       fenix: true
    );
    Get.lazyPut<GetPersonalInfoUseCase>(
      () => GetPersonalInfoUseCase(
        repository: Get.find(),
      ),
       fenix: true
    );
     Get.lazyPut<AddFilesUseCase>(
      () => AddFilesUseCase(
        repository: Get.find(),
      ),
       fenix: true
    );
     Get.lazyPut<GetFilesUseCase>(
      () => GetFilesUseCase(
        repository: Get.find(),
      ),
       fenix: true
    );
     Get.lazyPut< GetMedicalDataUseCase>(
      () =>  GetMedicalDataUseCase(
        repository: Get.find(),
      ),
       fenix: true
    );
    //**  MedicalHistoryController&& PatientInfoController && MedicalDataController */
    Get.create<MedicalHistoryController>(
      () => MedicalHistoryController(useCase: Get.find()),
    
    );

    Get.create<PatientInfoController>(
      () => PatientInfoController(
        useCase: Get.find(),
        getInfoUseCase: Get.find(),

      ),
      
    );
    Get.create<MedicalDataController>(
      () => MedicalDataController(useCase: Get.find(), addFileUseCase:  Get.find(),
      getMedicalUseCase: Get.find() ,
      getFileUseCase: Get.find()),

    );

    //** ___________________________________Doctor Feature_______________________________________    */

    Get.lazyPut<DoctorInPatientRemoteDataSource>(
      () => DoctorInPatientRemoteDataSourceImpl(
       
      ),
         fenix: true
    );

    Get.lazyPut<DoctorInPatientRepositoryImpl>(
      () => DoctorInPatientRepositoryImpl(
        remoteDataSource: Get.find(),
        networkInfo: Get.find<SettingServices>().networkInfo,
        tokenService: Get.find(),


        
      ),   fenix: true
    );
    //** ___________________________________Doctor useCase_______________________________________    */
    Get.lazyPut<GetAllDoctorUseCase>(
      () => GetAllDoctorUseCase(
        repository: Get.find<DoctorInPatientRepositoryImpl>(),
      ),
    );
    Get.lazyPut<AddFavoriteUseCase>(
      () => AddFavoriteUseCase(
        repository: Get.find<DoctorInPatientRepositoryImpl>(),
      ),
    );
     Get.lazyPut<RemoveFavoriteUseCase>(
      () => RemoveFavoriteUseCase(
        repository: Get.find<DoctorInPatientRepositoryImpl>(),
      ),
    );
    Get.lazyPut<UpdateRatingUseCase>(
      () => UpdateRatingUseCase(
        repository: Get.find<DoctorInPatientRepositoryImpl>(),
      ),
    );
    Get.lazyPut<GetAllFavoriteDoctorUseCase>(
      () => GetAllFavoriteDoctorUseCase(
        repository: Get.find<DoctorInPatientRepositoryImpl>(),
      ),
    );

    //** ___________________________________Doctor controller_______________________________________    */

    Get.create<DoctorScreenController>(
      () => DoctorScreenController(
        getAllDoctorUseCase: Get.find(),
        addFavoriteUseCase: Get.find(),
        updateRatingUseCase: Get.find(),
      ),
    );

    Get.create<ShowDoctorsController>(
      () => ShowDoctorsController(
        getAllFavoriteDoctorUseCase: Get.find<GetAllFavoriteDoctorUseCase>(),
        removeFavoriteUseCase: Get.find< RemoveFavoriteUseCase>(),
      ),
    );

    //*********************************Appointment Feature*******************************************/

    Get.lazyPut<RemoteDataSourceAppointmentInPatient>(
      () => RemoteDataSourceAppointmentInPatientImpl(
    
      ),
    );

    Get.lazyPut<AppointmentRepository>(
      () => AppointmentRepositoryImpl(
        remoteDataSource: Get.find<RemoteDataSourceAppointmentInPatient>(),
        networkInfo: Get.find<SettingServices>().networkInfo,
        tokenService: Get.find<TokenService>(),
      ),
    );

    //******************useCase**********/
    Get.lazyPut<BookingAppointmentUseCase>(
      () => BookingAppointmentUseCase(
        repository: Get.find<AppointmentRepository>(),
      ),
    );
    Get.lazyPut<GetPreviousAppointmentsUseCase>(
      () => GetPreviousAppointmentsUseCase(
        repository: Get.find<AppointmentRepository>(),
      ),
    );
    Get.lazyPut<GetUpComingAppointmentsUseCase>(
      () => GetUpComingAppointmentsUseCase(
        repository: Get.find<AppointmentRepository>(),
      ),
    );

    //*************controller  */
    Get.create<BookingAppointmentController>(
      () => BookingAppointmentController(
        bookingUseCase: Get.find<BookingAppointmentUseCase>(),
      ),
    );
    Get.create<AppointmentsController>(
      () => AppointmentsController(
        getPreviousAppointmentsUseCase:
            Get.find<GetPreviousAppointmentsUseCase>(),
        getUpComingAppointmentsUseCase:
            Get.find<GetUpComingAppointmentsUseCase>(),
      ),
    );
    //************************************Doctor********************************/

    //************DoctorAppointment***************/
    Get.lazyPut<DoctorAppointmentRemoteDataSource>(
      () => DoctorAppointmentRemoteDataSourceImpl(
      )   
    );
    Get.lazyPut<DoctorAppointmentRepository>(
      () => DoctorAppointmentRepositoryImpl(
        networkInfo: Get.find<SettingServices>().networkInfo,
        remoteDataSource: Get.find<DoctorAppointmentRemoteDataSource>(),
        tokenService: Get.find<TokenService>(),
      ),
    );

    ///**AddNewAppointmentUseCase && GetAppointmentUseCase   */
    Get.lazyPut<GetWaitingAppointmentUseCase>(
      () => GetWaitingAppointmentUseCase(
        repository: Get.find<DoctorAppointmentRepository>(),
      ),
    );
    Get.lazyPut<AddNewAppointmentUseCase>(
      () => AddNewAppointmentUseCase(
        repository: Get.find<DoctorAppointmentRepository>(),
      ),
    );

    //* controlller /
    Get.create<AppointmentController>(
      () => AppointmentController(
        getAppointmentUseCase: Get.find<GetWaitingAppointmentUseCase>(),
      ),
    );
    Get.create<AddNewAppointmentController>(
      () => AddNewAppointmentController(
        addNewAppointmentUseCase: Get.find<AddNewAppointmentUseCase>(),
      ),
    );
    //******Doctor_Info ************/

    //**Remote DataSource */
    Get.lazyPut<DoctorDetailRemoteDataSource>(
      () => DoctorDetailRemoteDataSourceImpl(
    
      ),
    );

    //*****Repository********/
    Get.lazyPut<DoctorDetailRepository>(
      () => DoctorDetailRepositoryImpl(
        remoteDataSource: Get.find<DoctorDetailRemoteDataSource>(),
        networkInfo: Get.find<SettingServices>().networkInfo,
        tokenService: Get.find<TokenService>(),
      ),
    );

    //*******UseCase*******/
    Get.lazyPut<GetDoctorMyInfoUseCase>(
      () => GetDoctorMyInfoUseCase(
        repository: Get.find<DoctorDetailRepository>(),
      ),
    );
    Get.lazyPut<UpdateDoctorInfoUseCase>(
      () => UpdateDoctorInfoUseCase(
        repository: Get.find<DoctorDetailRepository>(),
      ),
    );
    Get.lazyPut<GetMyPatientUseCase>(
      () => GetMyPatientUseCase(repository: Get.find<DoctorDetailRepository>()),
    );

    //*******Controller ******/
    Get.create<DoctorMyInfoController>(
      () => DoctorMyInfoController(
        getDoctorMyInfoUseCase: Get.find<GetDoctorMyInfoUseCase>(),
        updateDoctorInfoUseCase: Get.find<UpdateDoctorInfoUseCase>(),
      ),
    );
    Get.create<MyPatientController>(
      () => MyPatientController(getMyPatientUseCase: Get.find()),
    );
    //**SugarMeasurement Feature */

    Get.lazyPut<SugarMeasurementRemoteDataSource>(
      () => SugarMeasurementRemoteDataSourceImpl(
      
      ),
    );
    Get.lazyPut<SugarMeasurementRepository>(
      () => SugarMeasurementRepositoryImpl(
        remoteDataSource: Get.find<SugarMeasurementRemoteDataSource>(),
        networkInfo: Get.find<SettingServices>().networkInfo,
        tokenService: Get.find<TokenService>(),
      ),
    );

    Get.lazyPut<AddSugarMuserUseCase>(
      () => AddSugarMuserUseCase(
        repository: Get.find<SugarMeasurementRepository>(),
      ),
    );

    Get.create<SugarMeasurementController>(
      () => SugarMeasurementController(
        addSugarMuserUseCase: Get.find<AddSugarMuserUseCase>(),
      ),
    );
  }
}
