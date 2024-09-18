import 'package:akashx/features/auth/data/network/dto/login_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/domain/model/user.dart';
import '../datasource/dto/login_response.dart';

part 'auth_client.g.dart';

@injectable
@RestApi()
abstract class AuthClient {
  @factoryMethod
  factory AuthClient(@Named("auth") Dio dio,
      {@Named("baseUrlAuth") String baseUrl}) = _AuthClient;

  @POST("akashx_v10_login")
  Future<LoginResponseDTO> loginUser(
    @Body() Map<String, String> user,
  );

  @PUT("update")
  Future<LoginResponse> updateUser(
    @Header("Authorization") String authToken,
    @Body() Map<String, dynamic> user,
  );

  @GET("me")
  Future<User?> userDetails(
    @Header("Authorization") String authToken,
  );
}
