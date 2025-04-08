
import '../../domain/entity/verify_email_response_entity.dart';

class VerifyEmailResponseDto extends VerifyEmailResponseEntity {
  VerifyEmailResponseDto({super.status,this.message,this.code});
  String? message;
  num ?code;
  VerifyEmailResponseDto.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }
}
