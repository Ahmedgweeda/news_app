import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/states.dart';

Widget buildArticleItem(article)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120,
        height:120 ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            )
        ),


      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(height: 120,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${article['title']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,

                ),
              ),
              Text('${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),



            ],
          ),
        ),
      )

    ],
  ),
);


Widget division(){
  return  Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      width: double.infinity,
      height: .8,
      decoration: BoxDecoration(
          color: Colors.grey
      ),

    ),
  );
}





Widget articleBuilder(list){
  return ConditionalBuilder(
      condition :list.length>0,
      builder:(context)=>
          ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>buildArticleItem(list[index]),
              separatorBuilder:(context,index)=>division(),
              itemCount: 15),
      fallback:(context)=>Center(child: CircularProgressIndicator())

  );
}



























