import 'dart:developer';

import 'package:flower_app/categories/domain/entity/categories_response_entity.dart';
import 'package:flower_app/categories/domain/use_case/categories_use_case.dart';
import 'package:flower_app/categories/presentation/manager/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/result.dart';
@injectable
class CategoriesViewModel extends Cubit<CategoriesState> {
  CategoriesViewModel(this._categoriesUseCase):super(CategoriesLoadingState());
  final CategoriesUseCase _categoriesUseCase ;
   List<CategoriesEntity> categories=[];
   void doIntent(CategoriesIntent categoriesIntent){
     switch(categoriesIntent){
       case GetAllCategoriesIntent():
         _getAllCategories();
         break;
     }
   }
  Future<void> _getAllCategories()async{
    emit(CategoriesLoadingState());
    var result=await _categoriesUseCase.execute();
    switch(result){
      case Success():
        var data=result.data;
        if(data!.message=="success"){
          categories=data.categories!;
            for(var i=0;i<categories.length;i++){
              log("categories ${categories[i].name}");
            }
          emit(CategoriesSuccessState(data.categories!));
        }
        else{
          emit(CategoriesErrorState(data.message!));
        }
        break;
      case Error():
        emit(CategoriesErrorState(result.exception!));
        break;
    }

  }
}
sealed class CategoriesIntent {}

class GetAllCategoriesIntent extends CategoriesIntent {}