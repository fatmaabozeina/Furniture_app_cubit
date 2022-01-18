import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyans_creative_task/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:lyans_creative_task/data_model.dart';

import 'package:lyans_creative_task/dio_helper.dart';

class FurnitureCubit extends Cubit<FurnitureStates> {
  FurnitureCubit() : super(FurnitureInitialState());

  FurnitureCubit get(context) => BlocProvider.of(context);

  List<A> aItems = [];
  List<A> bItems = [];
  List<A> cItems = [];
  List<A> dItems = [];
  Color baseColor = Color(0xFFF5EEE1);
  Color labelColor = Colors.amber;
  List<String> categoryNames = ['Chairs', 'Dinning', 'Sofas', 'Bedrooms'];
  int currentIndex;
  void changeCategoryButton(int index) {
    currentIndex = index;
    emit(FChangeCategoryButtonState());
  }

  void getChairs() async {
    await DioHelper().getData('furniture', null).then((value) {
      aItems = value.a;
      print('chairs');

      emit(FGetChairsDataSuccefulState());
    }).catchError((onError) {
      print('data error');
      emit(FGetChairsDataErrorState(Error));
    });
  }

  void getDinningRooms() async {
    await DioHelper().getData('furniture', null).then((value) {
      aItems = value.b;
      print('doors');

      emit(FGetDoorsDataSuccefulState());
    }).catchError((onError) {
      print('data error');
      emit(FGetDoorsDataErrorState(onError));
    });
  }

  void getSofas() async {
    await DioHelper().getData('furniture', null).then((value) {
      aItems = value.c;
      print('sofas');

      emit(FGetSofasDataSuccefulState());
    }).catchError((onError) {
      print('data error');
      emit(FGetSofasDataErrorState(onError));
    });
  }

  void getBedrooms() async {
    await DioHelper().getData('furniture', null).then((value) {
      aItems = value.d;
      print('bedrooms');

      emit(FGetBedRoomsDataSuccefulState());
    }).catchError((onError) {
      print('data error');
      emit(FGetBedRoomsDataErrorState(onError));
    });
  }
}
