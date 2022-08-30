import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(article: article)));
    },
    child: Container(
      margin: EdgeInsets.all(18.0),
      padding: EdgeInsets.all(22.0),
      decoration: BoxDecoration(
          color: Colors.cyan.shade400,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          article.urlToImage != null
              ? Container(
                  height: 260.0,
                  margin: EdgeInsets.all(17.0),
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://pbs.twimg.com/media/FapNuH5X0AYLR4v?format=jpg&name=900x900'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                ),
          SizedBox(height: 18.0),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(13.0),
            ),
            child: Text(
              article.source.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            article.title,
            style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )
        ],
      ),
    ),
  );
}
