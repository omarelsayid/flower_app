import '../../domain/entity/forget_response_password_entity.dart';

class ForgetResponsePasswordDto extends ForgetResponsePasswordEntity {
  ForgetResponsePasswordDto({super.message, super.info, this.code});

  num? code;

  ForgetResponsePasswordDto.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
    code = json['code'];
  }
}
