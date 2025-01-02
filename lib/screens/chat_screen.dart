import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ChatAppBar(context),
      body: ListView(
        children: [
          Category(),
          ...List.generate(10, (index) => Room()),
        ],
      ),
    );
  }

  AppBar ChatAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[200],
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      title: Text("Trò chuyện"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CircleAvatar(
            child: Image(
              image: AssetImage("images/avatar/no-avatar.png"),
              height: 28,
            ),
            backgroundColor: Colors.white,
            radius: 18,
          ),
        )
      ],
    );
  }

  Widget Category() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Trang chủ",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.message,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Chuỗi tin nhắn",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Room() {
    return Container(
      margin: EdgeInsets.only(bottom: 20, right: 12, left: 12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              child: Image(
                image: AssetImage("images/avatar/no-avatar.png"),
              ),
              radius: 24,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nguyet Nguyen Thi Minh",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "11 thg 11",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "Dear các e, Theo kế hoạch thì sau khi kết thúc đồ án theo kịch bản, các ac Fsoft sẽ ra tổ chức thi kết thúc môn CNPM cho các e.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
