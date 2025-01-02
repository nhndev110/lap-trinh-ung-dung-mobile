import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/models/news_model.dart';
import 'package:test1/providers/news_provider.dart';
import 'package:test1/services/news_category_service.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false).getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: "Flutter ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "News",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: NewsCategoryService.categories
                .map(
                  (item) => Category(
                    newsProvider,
                    item.bgURL,
                    item.categoryName,
                  ),
                )
                .toList(),
          ),
          newsProvider.isLoading
              ? Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  children:
                      newsProvider.list.map((item) => Article(item)).toList(),
                ),
        ],
      ),
    );
  }

  Widget Category(NewsProvider newsProvider, String bgURL, String str) {
    return Expanded(
      child: InkWell(
        onTap: () {
          newsProvider.getList(category: str);
        },
        child: Container(
          height: 100,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              opacity: 0.6,
              fit: BoxFit.cover,
              image: AssetImage(bgURL),
            ),
            color: Color.fromARGB(255, 61, 89, 112),
          ),
          child: Center(
            child: Text(
              str,
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  )
                ],
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Article(NewsModel newsModel) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              newsModel.urlToImage ?? '',
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
              alignment: Alignment.center,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  '/images/no-image.jpg',
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                  alignment: Alignment.center,
                );
              },
            ),
          ),
          SizedBox(height: 4),
          Text(
            newsModel.title ?? "",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 4),
          Text(
            newsModel.description ?? "",
            style: TextStyle(
              color: const Color.fromARGB(255, 121, 121, 121),
            ),
          ),
        ],
      ),
    );
  }
}
