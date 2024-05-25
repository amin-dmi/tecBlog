class ApiConsttant {
  static const String hostUrl = "https://techblog.sasansafari.com";
  static const String baseUrl =
      "https://techblog.sasansafari.com/Techblog/api/";
  static const String getHomeItems = baseUrl + "home/?command=index";
  static const String getArticleList =
      baseUrl + "article/get.php?command=new&user_id=";

  static const String getArticleListWithTagId = baseUrl +
      "article/get.php?command=get_articles_with_tag_id&tag_id=1&user_id=1";

  static const String postRegister = baseUrl + "register/action.php";
}
