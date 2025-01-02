import 'package:flutter/material.dart';

class GmailScreen extends StatelessWidget {
  const GmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GmailAppBar(context),
      body: GmailBody(),
      floatingActionButton: GmailFloatingButton(context),
    );
  }

  FloatingActionButton GmailFloatingButton(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.white,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                    left: 12,
                    top: 8,
                    bottom: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_file_outlined,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send_rounded,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 12, left: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 197, 197, 197),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Đến",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 12, left: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 197, 197, 197),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Từ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      )
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Tiêu đề",
                    contentPadding: EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 197, 197, 197),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 197, 197, 197),
                        width: 0.5,
                      ),
                    ),
                  ),
                  cursorColor: Colors.blue,
                ),
                Expanded(
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Soạn thư",
                      contentPadding: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                    cursorColor: Colors.blue,
                    keyboardType: TextInputType.multiline,
                  ),
                )
              ],
            );
          },
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      label: Text(
        "Soạn thư",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: Icon(
        Icons.edit,
        color: Colors.red,
      ),
    );
  }

  AppBar GmailAppBar(BuildContext context) {
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
      title: Text("Hộp thư"),
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

  Widget GmailBody() {
    return ListView(
      padding: EdgeInsets.only(left: 12, right: 12),
      children: [
        Category(),
        ...List.generate(10, (index) => Mail()),
      ],
    );
  }

  Widget Mail() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "[KHH-CNPM2024][K45] Vv dien thong tin ca nhan",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Dear các e, Theo kế hoạch thì sau khi kết thúc đồ án theo kịch bản, các ac Fsoft sẽ ra tổ chức thi kết thúc môn CNPM cho các e.",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.star_border)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding Category() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        "Chính",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
