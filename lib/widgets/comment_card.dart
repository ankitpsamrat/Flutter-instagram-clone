// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class CommentCard extends StatefulWidget {
//   const CommentCard({Key? key, required this.snap}) : super(key: key);

//   final snap;

//   @override
//   State<CommentCard> createState() => _CommentCardState();
// }

// class _CommentCardState extends State<CommentCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         vertical: 18,
//         horizontal: 16,
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundImage: NetworkImage(
//               'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
//             ),
//             radius: 18,
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                             text: snap.data()['name'],
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                             )),
//                         TextSpan(
//                           text: ' ${snap.data()['text']}',
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 4),
//                     child: Text(
//                       DateFormat.yMMMd().format(
//                         snap.data()['datePublished'].toDate(),
//                       ),
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: const Icon(
//               Icons.favorite,
//               size: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
