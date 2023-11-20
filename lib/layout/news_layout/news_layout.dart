import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>NewsCubit()..getBusiness() ,
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit =NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'News App',
              ),
              actions: [
                Icon(Icons.search),
              ],

            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index){cubit.changeBottomNavigation(index);},
            ),
          body: cubit.screens[cubit.currentIndex],
          );
        },
      )
    );
  }
}
