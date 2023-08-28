import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news/cubit/cubit.dart';
import 'package:news_app/layouts/news/cubit/states.dart';
import 'package:news_app/shared/components/componant.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  validate: (String value){
                    if(value.isEmpty){
                      return('search must not be empty');
                    }
                    return null;
                  },
                  label: 'search',
                  prefix: Icons.search,
                  onTap: (){},
                  onChange: (value){

                  },

                ),


              ],
            ),
          ),

        );
      },
    );
  }
}
