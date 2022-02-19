import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yozu/theme/color/light_color.dart';

class MessageScreen extends StatefulWidget {
	final String chatDetails;

	const MessageScreen({Key key, this.chatDetails}) : super(key: key);

	@override
	MessageScreenState createState() {
		return MessageScreenState();
	}
}

class Message {
	final int user;
	final String description;

	Message(this.user, this.description);
}

class MessageScreenState extends State<MessageScreen> {
	final lastMsg = FirebaseStorage.instance;
	final seenRef = FirebaseStorage.instance;
	final whomtoUser = FirebaseStorage.instance;
	final currentUser = FirebaseStorage.instance;
	DatabaseReference _chatStream;
	DatabaseReference _chatLiveStream;
	DataSnapshot data;
	var _msgCount = 1;
	final _messageController = TextEditingController();
	bool isMessageInputEdited = false;

	final List<String> avatars = [
		'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media',
		'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F4.jpg?alt=media',
		'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F6.jpg?alt=media',
		'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F7.jpg?alt=media',
		'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2Fdev_damodar.jpg?alt=media&token=aaf47b41-3485-4bab-bcb6-2e472b9afee6',
		'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2Fdev_sudip.jpg?alt=media',
		'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2Fdev_sid.png?alt=media',
	];

	final List<Message> messages = [
		Message(0,
				"But I may not go if the weather is bad. So lets see the weather condition 😀"),
		Message(0, "I suppose I am."),
		Message(1, "Are you going to market today?"),
		Message(0, "I am good too"),
		Message(1, "I am fine, thank you. How are you? "),
		Message(1, "Hi,"),
		Message(0, "How are you today?"),
		Message(0, "Hello,"),
	];

	@override
	void initState() {
		super.initState();
		// Start listening to changes in message textfield
		_messageController.addListener(_messageInputChange);

		Map<String, dynamic> seenstatus = {
			'seen': true,
			'unreadmessages': 0,
		};
		// seenRef.ref()
		// 		.child('Users/' + FirebaseAuth.instance.currentUser.uid + "/chats")
		// //.child("userid")
		// 		.child("ggz1P1wR0pT4NMGRLTSnmT4xZI23")
		// 		.update(seenstatus);
		//
		// this._chatStream = FirebaseDatabase.instance
		// 		.reference()
		// //.child('Users/'+FirebaseAuth.instance.currentUser.uid+"/chats/"+"userid/"+"messages");
		// 		.child('Users/' +
		// 		FirebaseAuth.instance.currentUser.uid +
		// 		"/chats/" +
		// 		"ggz1P1wR0pT4NMGRLTSnmT4xZI23/" +
		// 		"messages");
		//
		// this._chatLiveStream = FirebaseDatabase.instance
		// 		.reference()
		// //.child('Users/'+FirebaseAuth.instance.currentUser.uid+"/chats/"+"userid/"+"messages");
		// 		.child('Users/' +
		// 		FirebaseAuth.instance.currentUser.uid +
		// 		"/chats/" +
		// 		"ggz1P1wR0pT4NMGRLTSnmT4xZI23/" +
		// 		"messages");
	}



	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: PreferredSize(
				child: AppBar(
					elevation: 0.0,
					brightness: Brightness.light,
					backgroundColor: LightColor.yboxbackpurple,
					automaticallyImplyLeading: false,
					centerTitle: true,
					leading: IconButton(
						icon: const Icon(
							Icons.arrow_back_ios,
							size: 28,
							color: Colors.black,
						),
						onPressed: () => Navigator.pop(context),
					),
					title: const Text(
						"Chat",
						style: TextStyle(
							color: Colors.black,
							fontWeight: FontWeight.bold,
						),
					),
					actions:  <Widget>[
						InkWell(
							onTap: (){
								Navigator.of(context).push(
										MaterialPageRoute(builder: (context) =>
												const MessageScreen(chatDetails: '',)));

							},
						  child: const Padding(
						  	padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
						    child: Icon(
						    	Icons.copy_outlined,
						    	color: Colors.black87,
						    ),
						  ),
						)
					//	circleAppBarImage()
					],
				),
				preferredSize: Size.square(kToolbarHeight),
			),
			body: Stack(
				children: <Widget>[
					Positioned.fill(
						child: Container(
							decoration: BoxDecoration(
								border: Border.all(color:LightColor.ylightpurple),
								gradient: const LinearGradient(
									// begin: Alignment.bottomLeft,
									// end: Alignment.bottomRight,
									colors: [
										LightColor.yboxbackpurple,
										LightColor.yboxbackpurple,
									],
								),
							),
						),
					),
					Column(
						mainAxisSize: MainAxisSize.max,
						children: <Widget>[
							messageListComponent(context),
							createMessageInputComponent(context),
						],
					),
				],
			),
		);
	}

	Widget circleAppBarImage() {
		// wrapped around a column so that the avatar doesn't stretch
		return Container(
			margin: const EdgeInsets.only(right: 10),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: const <Widget>[
					CircleAvatar(
							radius: 20,
							backgroundImage: NetworkImage(
									//"https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/img%2F1.jpg?alt=media"))
									"https://www.google.com/url?sa=i&url=https%3A%2F%2Ficon-icons.com%2Ficon%2Fcopy%2F173224&psig=AOvVaw1IkwkB9yJRvPCGqvRvMtVQ&ust=1645104795595000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPC_042rhPYCFQAAAAAdAAAAABAK"))
				],
			),
		);
	}

	Widget messageListComponent(BuildContext context) {
		// wrapped around a column so that the avatar doesn't stretch
		return Expanded(
			flex: 2,
			child: Container(
				padding: EdgeInsets.fromLTRB(2, 8, 2, 14),
				decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.only(
						bottomLeft: Radius.circular(36.0),
						bottomRight: Radius.circular(36.0),
					),
				),

				child: Column(
				  children: <Widget>[
				    Expanded(
				      child: ListView.separated(
				        physics: BouncingScrollPhysics(),
				        separatorBuilder: (context, index) {
				          return const SizedBox(height: 10.0);
				        },
				        reverse: true,
				        itemCount: messages.length,
				        itemBuilder: (BuildContext context, int index) {
				          Message m = messages[index];
				          if (m.user == 0) return _buildMessageRow(m, current: true);
				          return _buildMessageRow(m, current: false);
				        },
				      ),
				    ),
				  ],
				),

				// child: StreamBuilder(
				// 	stream: _chatStream.orderByKey().onValue,
				// 	builder: (ctx, chatSnapShot) {
				// 		if (chatSnapShot.connectionState == ConnectionState.waiting) {
				// 			return Center(
				// 				child: CircularProgressIndicator(),
				// 			);
				// 		}
				// 		final Event chatDocs = chatSnapShot.data as Event;
				// 		try {
				// 			print(chatDocs.snapshot.value.toString());
				// 			print(chatDocs.snapshot.value.length.toString() + ' length');
				// 			print(chatDocs.snapshot.key);
				// 			return ListView.builder(
				// 				physics: BouncingScrollPhysics(),
				// 				// separatorBuilder: (context, index) {
				// 				//   return const SizedBox(height: 10.0);
				// 				// },
				// 				reverse: true,
				// 				itemCount: chatDocs.snapshot.value.length,
				// 				//itemCount: messages.length,
				// 				itemBuilder: (BuildContext context, int index) {
				// 					LinkedHashMap decoded =
				// 					chatDocs.snapshot.value as LinkedHashMap;
				// 					String key = decoded.keys.elementAt(index).toString();
				// 					print(decoded.containsKey(key));
				// 					print(decoded[key]);
				// 					print(decoded[key]['message']);
				// 					//Message m = decoded[key]['message'];
				// 					String message = decoded[key]['message'];
				// 					return decoded[key]['userId'] ==
				// 							FirebaseAuth.instance.currentUser.uid
				// 							? _buildMessageRow(message, current: true)
				// 							: _buildMessageRow(message, current: false);
				// 				},
				// 			);
				// 		} catch (ex) {
				// 			print('Exception while getting messages : ' + ex.toString());
				// 			return Container();
				// 		}
				// 	},
				// ),
			),
		);
	}


	Row _buildMessageRow(Message message, {bool current}) {
	//Row _buildMessageRow(String message, {bool current}) {
		return Row(
			mainAxisAlignment:
			current ? MainAxisAlignment.end : MainAxisAlignment.start,
			crossAxisAlignment:
			current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
			children: <Widget>[
				SizedBox(width: current ? 30.0 : 20.0),
				if (!current) ...[
					CircleAvatar(
						backgroundImage: NetworkImage(
							current ? avatars[0] : avatars[1],
						),
						radius: 20.0,
					),
					const SizedBox(width: 5.0),
				],

				///Chat bubbles
				Container(
					padding: EdgeInsets.only(
						bottom: 5,
						right: 0,
					),
					child: Column(
						crossAxisAlignment:
						current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
						children: <Widget>[
							Container(
								constraints: BoxConstraints(
									minHeight: 40,
									maxHeight: 250,
									maxWidth: MediaQuery.of(context).size.width * 0.7,
									minWidth: MediaQuery.of(context).size.width * 0.1,
								),
								decoration: BoxDecoration(
									color: current ? LightColor.ylightorange : LightColor.yboxpurple,
									borderRadius: current
											? BorderRadius.only(
										topLeft: Radius.circular(20),
										bottomRight: Radius.circular(20),
										bottomLeft: Radius.circular(20),
										//topRight: Radius.circular(20),

									)
											: BorderRadius.only(
										bottomRight: Radius.circular(20),
										bottomLeft: Radius.circular(20),
										topRight: Radius.circular(20),
									),
								),
								child: Padding(
									padding: const EdgeInsets.only(
											left: 15, top: 10, bottom: 5, right: 5),
									child: Column(
										mainAxisSize: MainAxisSize.min,
										crossAxisAlignment: current
												? CrossAxisAlignment.end
												: CrossAxisAlignment.start,
										children: <Widget>[
											Padding(
												padding: const EdgeInsets.only(right: 10),
												child: Text(
													message.description,
													//message,
													style: TextStyle(
														color: current ? Colors.white : Colors.black,
													),
												),
											),
											// Icon(
											// 	Icons.done_all,
											// 	color: Colors.white,
											// 	size: 14,
											// )
										],
									),
								),
							),
							SizedBox(
								height: 2,
							),
							Text(
								"2:02",
								style: TextStyle(
										fontSize: 12, color: Colors.black.withOpacity(0.5)),
							)
						],
					),
				),
				if (current) ...[
					const SizedBox(width: 5.0),
					CircleAvatar(
						backgroundImage: NetworkImage(
							current ? avatars[0] : avatars[1],
						),
						radius: 10.0,
					),
				],
				SizedBox(width: current ? 20.0 : 30.0),
			],
		);
	}

	Widget createMessageInputComponent(BuildContext context) {
		// wrapped around a column so that the avatar doesn't stretch
		return Container(
			padding: const EdgeInsets.fromLTRB(24, 16, 16, 12),
			decoration: const BoxDecoration(
				color: Colors.transparent,
			),
			child: TextField(
				style: const TextStyle(
					fontSize: 16.0,
					color: Colors.black87,
				),

				cursorColor: Colors.black,
				controller: _messageController,
				keyboardType: TextInputType.multiline,
				maxLines: 4,
				autofocus: false,
				decoration: InputDecoration(
					contentPadding: const EdgeInsets.symmetric(
							horizontal: 20.0,
							vertical: 8.0
					),

					prefixIcon: const Icon(
						Icons.mic,
						color: Colors.black87,
					),
					suffixIcon: IconButton(
						icon: Icon(Icons.send),
						color:
						Colors.grey[700].withOpacity(isMessageInputEdited ? 1.0 : 0.4),
						onPressed: () async {
							setState(() {
								_msgCount++;
							});
							//	submit(_msgCount);
						},
					),
					hintText: "Ask your doubt...",
					hintStyle: TextStyle(
						color: Colors.grey[700].withOpacity(0.8),
					),
					border: OutlineInputBorder(
						borderSide: const BorderSide(
							color: Colors.transparent,
							width: 1.0,
						),
						borderRadius: BorderRadius.circular(32.0),
					),
					fillColor: Colors.white54,
					filled: true,
					focusedBorder: OutlineInputBorder(
						borderSide: BorderSide(
							color: Colors.white.withOpacity(0.0),
							width: 0.2,
						),
						borderRadius: BorderRadius.circular(32.0),
					),
				),
			),
		);
	}

	// void submit(int count) async {
	// 	int time = Timestamp.now().microsecondsSinceEpoch;
	// 	FocusScope.of(context).unfocus();
	// 	final _chatRef = currentUser
	// 			.ref()
	// 			.child('Users')
	// 			.child(FirebaseAuth.instance.currentUser.uid)
	// 			.child("chats")
	// 			.child("ggz1P1wR0pT4NMGRLTSnmT4xZI23")
	// 			.child("messages")
	// 			.child(time.toString());
	// 	final _whomRef = whomtoUser
	// 			.ref()
	// 			.child('Users')
	// 			.child("ggz1P1wR0pT4NMGRLTSnmT4xZI23")
	// 			.child("chats")
	// 			.child(FirebaseAuth.instance.currentUser.uid)
	// 			.child("messages")
	// 			.child(time.toString());
	//
	// 	print(_chatRef);
	//
	// 	Map<String, dynamic> userData = {
	// 		'imgUrl': "image_url",
	// 		'time': time,
	// 		'message': _messageController.text.toString().trim(),
	// 		'userId': FirebaseAuth.instance.currentUser.uid,
	// 		'userName': FirebaseAuth.instance.currentUser.displayName,
	// 	};
	// 	_chatRef.set(userData);
	// 	_whomRef.set(userData);
	//
	// 	Map<String, dynamic> lastMap = {
	// 		'lastMessageOn': time,
	// 	};
	//
	// 	Map<String, dynamic> seenstatus = {
	// 		'seen': false,
	// 		'unreadmessages': count,
	// 	};
	// 	seenRef
	// 			.ref()
	// 			.child('Users/' + FirebaseAuth.instance.currentUser.uid + "/chats")
	// 			.child("ggz1P1wR0pT4NMGRLTSnmT4xZI23")
	// 			.update(seenstatus);
	//
	// 	lastMsg
	// 			.ref()
	// 			.child('Users')
	// 			.child(FirebaseAuth.instance.currentUser.uid)
	// 			.update(lastMap);
	// 	_messageController.clear();
	// 	userData.clear();
	// 	lastMap.clear();
	// 	seenstatus.clear();
	// }

	@override
	void dispose() {
		super.dispose();
		_messageController.dispose();
	}

	_messageInputChange() {
		if (_messageController.text.length <= 0) {}
		setState(() {
			isMessageInputEdited = (_messageController.text.length > 0);
		});
	}

}
