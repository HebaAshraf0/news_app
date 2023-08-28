import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news/cubit/cubit.dart';
import 'package:news_app/layouts/news/cubit/states.dart';
import 'package:news_app/modules/searchScreen.dart';
import 'package:news_app/shared/components/componant.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
       listener: (context,state){},
       builder: (context,state){
         var cubit =NewsCubit.get(context);
         return  Scaffold(
           appBar: AppBar(
             title:Text(
                 'News App'
             ) ,
             actions: [
               IconButton(
                 onPressed: (){
                 navigateTo(context, SearchScreen());
               },
                 icon: Icon(Icons.search),
               ),
             ],

           ),
           body: cubit.screens[cubit.currentIndex],
           bottomNavigationBar: BottomNavigationBar(
             items:cubit.bottomItems,
             currentIndex: cubit.currentIndex,
             onTap: (index){
               cubit.changeBottomNavBar(index);

             },
           ),

         );
       },
      ),
    );
  }
}
