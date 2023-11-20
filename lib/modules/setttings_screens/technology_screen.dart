import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list =NewsCubit.get(context).technology;
    return BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state) {
          return articleBuilder(list);}
    );
  }
}

