import 'package:flutter/material.dart';
import 'package:postai/utils/colors.dart';

class Message {
  final String title;
  final String message;

  Message({required this.title, required this.message});
}

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<Message> messages = [
    Message(
      title: 'Parcel Pickup Confirmation',
      message:
          'Hello [Customer Name], your parcel pickup request for package ID #ABC123 has been successfully scheduled for tomorrow morning. Our courier will collect it between 9 AM and 11 AM. Thank you for choosing our services!',
    ),
    Message(
      title: 'Parcel Delivery Notification',
      message:
          'Your parcel with tracking number #ABC123456789 has been successfully dispatched from our distribution center. It is currently in transit and is expected to arrive at your destination within the next 2-3 business days.',
    ),
    Message(
      title: 'Special Offer Announcement',
      message:
          'Exciting news! Enjoy free express shipping on all parcels above \$50 for a limited time. Upgrade your shipping experience with our premium courier services and get your packages delivered faster than ever.',
    ),
    Message(
      title: 'Special Offer Announcement',
      message:
          'Exciting news! Enjoy free express shipping on all parcels above \$50 for a limited time. Upgrade your shipping experience with our premium courier services and get your packages delivered faster than ever.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: messages.map((message) => _buildMessageItem(message)).toList(),
    );
  }

  Widget _buildMessageItem(Message message) {
    return Dismissible(
      key: Key(message.title), // Unique key for each item
      onDismissed: (direction) {
        // Remove the item from the data source when dismissed
        setState(() {
          messages.remove(message);
        });
        // Show a snackbar to indicate item is removed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${message.title} dismissed"),
          ),
        );
      },
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:  Colors.redAccent, // Background color when swiping
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(postblue).withOpacity(.1),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: ListTile(
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          subtitleTextStyle:
              const TextStyle(color: Colors.black54, fontSize: 16),
          title: Text(message.title),
          subtitle: Text(message.message),
        ),
      ),
    );
  }
}
