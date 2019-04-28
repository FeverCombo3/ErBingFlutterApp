import 'package:flutter_project/model/Article.dart';
import 'package:flutter_project/net/Address.dart';
import 'package:flutter_project/net/Api.dart';
import 'package:flutter_project/redux/ForumReducer.dart';
import 'package:flutter_project/redux/GlobalState.dart';
import 'package:redux/redux.dart';

class ForumDao{

  static getForumDao(Store<GlobalState> store,{page =0,bool needDb = false}) async{
      String url = Address.getForum() + Address.getPageParam("&",page);

      var res = await HttpManager.netFetch(url, null, null, null);
      if(res != null && res.result){
        List<Article> list = new List();
        var data = res.data;
        if(data == null || data.length == 0){
          return null;
        }

        var articles = data["article_list"];

        for(int i=0;i<articles.length;i++){
          list.add(Article.fromJson(articles[i]));
        }

        if(page == 0){
          store.dispatch(new RefreshForumAction(list));
        }else{
          store.dispatch(new LoadMoreForumAction(list));
        }
        return list;
      }else{
        return null;
      }

  }



}