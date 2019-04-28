
import 'package:flutter_project/style/Config.dart';

class Address{

  static const String baseUrl = "http://api.diershoubing.com:5000/";
  static const String baseUrl2 = "http://steamapi.diershoubing.com:5101/";

  static getNews(tag_type){
    return "${baseUrl}feed/tag/?tag_type=$tag_type";
  }

  static getNewsComments(feedid,platid){
    return "${baseUrl}comment/hot_common_reply/v2/2/$feedid/?is_hot=1&child_limit=2&has_hot=1&platform_id=1&game_plat_id=$platid&src=android";
  }


  static getBoard(){
    return "${baseUrl}show_board/list/";
  }

  static getForum(){
    return "${baseUrl2}article/list/?is_essence=0&od=2&has_ad=0";
  }


  static getPageParam(tab,pn,[rn = Config.PAGE_SIZE]){
    if(pn != null){
      if(rn != null){
        return "${tab}pn=$pn&rn=$rn";
      }else{
        return "${tab}pn=$pn";
      }
    }else{
      return "";
    }
  }
}