import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layouts/news/cubit/cubit.dart';
import '../layouts/news/cubit/states.dart';
import '../shared/components/componant.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder:(context, state){
        var list = NewsCubit.get(context).sports;
        return ConditionalBuilder(
          condition:  list.length > 0,
          builder: (context) =>
              ListView.separated(
                itemBuilder: (context, index)=>buildArticleItem(list[index],context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: 10,),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },

    );  }
}
