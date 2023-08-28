import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news/cubit/states.dart';
import 'package:news_app/modules/scienceScreen.dart';
import 'package:news_app/modules/settingsScreen.dart';
import 'package:news_app/modules/sportsScreen.dart';

import '../../../modules/businessScreen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
   NewsCubit() : super (NewsInitialStates());
   static NewsCubit get(context) =>BlocProvider.of(context);
   int currentIndex =0 ;

   List<BottomNavigationBarItem> bottomItems = [

      BottomNavigationBarItem(
          icon:Icon(
             Icons.business,
          ),
         label: 'Business',
      ),
      BottomNavigationBarItem(
         icon:Icon(
            Icons.sports,
         ),
         label: 'Sports',
      ),
      BottomNavigationBarItem(
          icon:Icon(
             Icons.science,
          ),
         label: 'Science',
      ),
      BottomNavigationBarItem(
          icon:Icon(
             Icons.settings,
          ),
         label: 'Settings',
      ),
   ];
   List<Widget> screens =[
      BusinessScreen(),
      SportsScreen(),
      ScienceScreen(),
      SettingsScreen(),
   ];
   void changeBottomNavBar(int index)
   {
      currentIndex=index;
      emit(NewsBottomNavStates());
   }
   List<dynamic> business=[];
   void getBusiness()
   {
      emit(NewsLoadingStates());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:{ // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY
             'country' : 'us',
             'category' : 'business',
             'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca',
          } ).then((value) {
        // print(value.data.toString());
         business= value.data['articles'];
         print(business[0]['title']);
         emit(NewsGetBusinessSuccessStates());
      }).catchError((error) {
         print(error.toString());
         emit(NewsGetBusinessErrorStates(error.toString()));
      });
   }


   List<dynamic> sports=[];
   void getSports()
   {
      emit(NewsSportsLoadingStates());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:{ // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY
             'country' : 'us',
             'category' : 'sports',
             'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca',
          } ).then((value) {
         // print(value.data.toString());
         sports= value.data['articles'];
         print(sports[0]['title']);
         emit(NewsGetSportsSuccessStates());
      }).catchError((error) {
         print(error.toString());
         emit(NewsGetSportsErrorStates(error.toString()));
      });
   }

   List<dynamic> science=[];
   void getScience()
   {
      emit(NewsScienceLoadingStates());
      DioHelper.getData(
          url: 'v2/top-headlines',
          query:{ // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY
             'country' : 'us',
             'category' : 'science',
             'apiKey' : '65f7f556ec76449fa7dc7c0069f040ca',
          } ).then((value) {
         // print(value.data.toString());
         science= value.data['articles'];
         print(science[0]['title']);
         emit(NewsGetScienceSuccessStates());
      }).catchError((error) {
         print(error.toString());
         emit(NewsGetScienceErrorStates(error.toString()));
      });
   }
}