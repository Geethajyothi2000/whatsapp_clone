import 'package:flutter/material.dart';

class ChatModel {
  final String name;
  IconData icon; // Changed from String to IconData
  bool isGroup;
  bool select = false; // Changed from Select to select to follow naming conventions
  String time;
  String currentMessage;
  final String status;
  final int id; // Added id field

  ChatModel({
    required this.name,
    this.icon = Icons.person, // Provide a default icon
    this.select = false, // Provide a default value for select
    this.isGroup = false,     // Provide a default value for isGroup
    this.time = '', // Provide a default value for time
    this.currentMessage = '', // Provide a default value for currentMessage
    required this.status,
    required this.id, // Initialize the id field
  });
}
