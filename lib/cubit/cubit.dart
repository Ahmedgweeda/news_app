import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/setttings_screens/technology_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/dio/dio_helper.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List<BottomNavigationBarItem>bottomItems= [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.medical_services_sharp),label: 'Technology'),

];

  void changeBottomNavigation(int index) {
    currentIndex = index;
    if(index==1){
      getSports();
    }
    if(index==2){
      getScience();
    }
    if(index==3){
      getTechnology();
    }
    emit(NewsBottomNavState());
  }



  List<Widget>screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    TechnologyScreen()
  ];

List<dynamic>business =[];
void getBusiness(){
  emit(NewsGetBusinessLoadingState());
  DioHelper.getData(url: 'v2/top-headlines',
      query:
      {
        'country': 'us',
        'category': 'business',
        'apiKey': 'e02ab685f78d4e058e91f73c0e65433f',
      },
    ).then((value)
  {
    business=value.data['articles'];
    emit(NewsGetBusinessSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));
  });
}


List<dynamic>sports =[];
void getSports(){
  emit(NewsGetSportsLoadingState());
  if(sports.length==0){
    DioHelper.getData(url: 'v2/top-headlines',
      query:
      {
        'country': 'us',
        'category': 'sports',
        'apiKey': 'e02ab685f78d4e058e91f73c0e65433f',
      },
    ).then((value)
    {
      sports=value.data['articles'];

      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }else{emit(NewsGetSportsSuccessState());}

}


List<dynamic>science =[];
void getScience(){
  emit(NewsGetScienceLoadingState());
  if(science.length==0){
    DioHelper.getData(url: 'v2/top-headlines',
      query:
      {
        'country': 'us',
        'category': 'science',
        'apiKey': 'e02ab685f78d4e058e91f73c0e65433f',
      },
    ).then((value)
    {
      science=value.data['articles'];

      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }
  else{
    emit(NewsGetScienceSuccessState());
  }

}


  List<dynamic>technology =[];
  void getTechnology(){
    emit(NewsGetTechnologyLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
      query:
      {
        'country': 'us',
        'category': 'technology',
        'apiKey': 'e02ab685f78d4e058e91f73c0e65433f',
      },
    ).then((value)
    {
      technology=value.data['articles'];
      emit(NewsGetTechnologySuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetTechnologyErrorState(error.toString()));
    });
  }
}