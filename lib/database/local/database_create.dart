import 'dart:convert';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

part 'database_create.g.dart';
//part 'database_home.g.view.dart'; // you do not need this part if you do not want to use the Form Generator property

// Define the ToDo table
const tableTodo = SqfEntityTable(
  tableName: 'todo',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('title', DbType.text),
    SqfEntityField('description', DbType.text),
    SqfEntityField('pickerColor', DbType.text),
    SqfEntityField('isSelected', DbType.bool, defaultValue: false),
  ],
);

// Define the database model
@SqfEntityBuilder(todoDbModel)
const todoDbModel = SqfEntityModel(
  modelName: 'TodoDatabaseModel',
  databaseName: 'todo_app.db',
  databaseTables: [tableTodo],
);