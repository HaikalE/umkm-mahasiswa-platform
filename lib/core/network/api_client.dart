import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  
  // Auth endpoints
  @POST('/auth/login')
  Future<HttpResponse<Map<String, dynamic>>> login(
    @Body() Map<String, dynamic> credentials,
  );
  
  @POST('/auth/register')
  Future<HttpResponse<Map<String, dynamic>>> register(
    @Body() Map<String, dynamic> userData,
  );
  
  @POST('/auth/logout')
  Future<HttpResponse<void>> logout();
  
  @GET('/auth/me')
  Future<HttpResponse<Map<String, dynamic>>> getCurrentUser();
  
  // UMKM endpoints
  @GET('/umkm/profiles')
  Future<HttpResponse<List<Map<String, dynamic>>>> getUMKMProfiles(
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('category') String? category,
    @Query('location') String? location,
  );
  
  @GET('/umkm/profiles/{id}')
  Future<HttpResponse<Map<String, dynamic>>> getUMKMProfile(
    @Path('id') String id,
  );
  
  @POST('/umkm/profiles')
  Future<HttpResponse<Map<String, dynamic>>> createUMKMProfile(
    @Body() Map<String, dynamic> profile,
  );
  
  @PUT('/umkm/profiles/{id}')
  Future<HttpResponse<Map<String, dynamic>>> updateUMKMProfile(
    @Path('id') String id,
    @Body() Map<String, dynamic> profile,
  );
  
  // Student endpoints
  @GET('/students/profiles')
  Future<HttpResponse<List<Map<String, dynamic>>>> getStudentProfiles(
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('university') String? university,
    @Query('major') String? major,
    @Query('skills') List<String>? skills,
  );
  
  @GET('/students/profiles/{id}')
  Future<HttpResponse<Map<String, dynamic>>> getStudentProfile(
    @Path('id') String id,
  );
  
  @POST('/students/profiles')
  Future<HttpResponse<Map<String, dynamic>>> createStudentProfile(
    @Body() Map<String, dynamic> profile,
  );
  
  @PUT('/students/profiles/{id}')
  Future<HttpResponse<Map<String, dynamic>>> updateStudentProfile(
    @Path('id') String id,
    @Body() Map<String, dynamic> profile,
  );
  
  // Products endpoints
  @GET('/products')
  Future<HttpResponse<List<Map<String, dynamic>>>> getProducts(
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('category') String? category,
    @Query('umkm_id') String? umkmId,
  );
  
  @GET('/products/{id}')
  Future<HttpResponse<Map<String, dynamic>>> getProduct(
    @Path('id') String id,
  );
  
  @POST('/products')
  Future<HttpResponse<Map<String, dynamic>>> createProduct(
    @Body() Map<String, dynamic> product,
  );
  
  @PUT('/products/{id}')
  Future<HttpResponse<Map<String, dynamic>>> updateProduct(
    @Path('id') String id,
    @Body() Map<String, dynamic> product,
  );
  
  @DELETE('/products/{id}')
  Future<HttpResponse<void>> deleteProduct(
    @Path('id') String id,
  );
  
  // Projects endpoints
  @GET('/projects')
  Future<HttpResponse<List<Map<String, dynamic>>>> getProjects(
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('category') String? category,
    @Query('project_type') String? projectType,
    @Query('budget_min') double? budgetMin,
    @Query('budget_max') double? budgetMax,
  );
  
  @GET('/projects/{id}')
  Future<HttpResponse<Map<String, dynamic>>> getProject(
    @Path('id') String id,
  );
  
  @POST('/projects')
  Future<HttpResponse<Map<String, dynamic>>> createProject(
    @Body() Map<String, dynamic> project,
  );
  
  @PUT('/projects/{id}')
  Future<HttpResponse<Map<String, dynamic>>> updateProject(
    @Path('id') String id,
    @Body() Map<String, dynamic> project,
  );
  
  @DELETE('/projects/{id}')
  Future<HttpResponse<void>> deleteProject(
    @Path('id') String id,
  );
  
  // Project Applications
  @POST('/projects/{id}/applications')
  Future<HttpResponse<Map<String, dynamic>>> applyToProject(
    @Path('id') String projectId,
    @Body() Map<String, dynamic> application,
  );
  
  @GET('/projects/{id}/applications')
  Future<HttpResponse<List<Map<String, dynamic>>>> getProjectApplications(
    @Path('id') String projectId,
  );
  
  @PUT('/applications/{id}/status')
  Future<HttpResponse<Map<String, dynamic>>> updateApplicationStatus(
    @Path('id') String applicationId,
    @Body() Map<String, dynamic> status,
  );
  
  // Chat endpoints
  @GET('/conversations')
  Future<HttpResponse<List<Map<String, dynamic>>>> getConversations();
  
  @GET('/conversations/{id}/messages')
  Future<HttpResponse<List<Map<String, dynamic>>>> getMessages(
    @Path('id') String conversationId,
    @Query('page') int page,
    @Query('limit') int limit,
  );
  
  @POST('/conversations/{id}/messages')
  Future<HttpResponse<Map<String, dynamic>>> sendMessage(
    @Path('id') String conversationId,
    @Body() Map<String, dynamic> message,
  );
  
  // Reviews endpoints
  @GET('/reviews')
  Future<HttpResponse<List<Map<String, dynamic>>>> getReviews(
    @Query('reviewee_id') String revieweeId,
  );
  
  @POST('/reviews')
  Future<HttpResponse<Map<String, dynamic>>> createReview(
    @Body() Map<String, dynamic> review,
  );
  
  // File upload
  @POST('/upload')
  @MultiPart()
  Future<HttpResponse<Map<String, dynamic>>> uploadFile(
    @Part(name: 'file') FormData file,
    @Part(name: 'type') String type,
  );
}