import 'dart:convert';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

part 'database_create.g.dart';
//part 'database_home.g.view.dart'; // you do not need this part if you do not want to use the Form Generator property

// Define Category table (One-to-Many relationship with Todo)
const tableCategory = SqfEntityTable(
  tableName: 'category',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('name', DbType.text),
    //SqfEntityField('description', DbType.text),
  ],
);

// Define Todo table (foreign key to Category table)
const tableTodo = SqfEntityTable(
  tableName: 'todo',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField('title', DbType.text),
    SqfEntityField('description', DbType.text),
    SqfEntityField('pickerColor', DbType.text),
    SqfEntityField('isSelected', DbType.bool, defaultValue: false),
    //SqfEntityField('categoryId', DbType.integer, defaultValue: 0),
    // Relationship definition: Todo -> Category (One-to-Many)
    SqfEntityFieldRelationship(
      parentTable: tableCategory,
      relationType: RelationType.ONE_TO_MANY,
      deleteRule: DeleteRule.CASCADE, // If a category is deleted, delete related products
      //fieldName: 'CategoryId',
      defaultValue: 0, // Default value for categoryId if not provided
    ),
  ],
);

// Define the database model
@SqfEntityBuilder(todoDbModel)
const todoDbModel = SqfEntityModel(
  modelName: 'TodoDatabaseModel',
  databaseName: 'todo_app.db',
  databaseTables: [
    tableCategory,
    tableTodo,
  ],
);