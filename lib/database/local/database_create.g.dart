// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_create.dart';

// **************************************************************************
// SqfEntityGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names

//  These classes was generated by SqfEntity
//  Copyright (c) 2019, All rights reserved. Use of this source code is governed by a
//  Apache license that can be found in the LICENSE file.

//  To use these SqfEntity classes do following:
//  - import model.dart into where to use
//  - start typing ex:Todo.select()... (add a few filters with fluent methods)...(add orderBy/orderBydesc if you want)...
//  - and then just put end of filters / or end of only select()  toSingle() / or toList()
//  - you can select one or return List<yourObject> by your filters and orders
//  - also you can batch update or batch delete by using delete/update methods instead of tosingle/tolist methods
//    Enjoy.. Huseyin Tokpunar

// BEGIN TABLES
// Todo TABLE
class TableTodo extends SqfEntityTableBase {
  TableTodo() {
    // declare properties of EntityTable
    tableName = 'todo';
    primaryKeyName = 'id';
    primaryKeyType = PrimaryKeyType.integer_auto_incremental;
    useSoftDeleting = false;
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)

    // declare fields
    fields = [
      SqfEntityFieldBase('title', DbType.text),
      SqfEntityFieldBase('description', DbType.text),
      SqfEntityFieldBase('pickerColor', DbType.text),
      SqfEntityFieldBase('isSelected', DbType.bool, defaultValue: false),
    ];
    super.init();
  }
  static SqfEntityTableBase? _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableTodo();
  }
}
// END TABLES

// BEGIN DATABASE MODEL
class TodoDatabaseModel extends SqfEntityModelProvider {
  TodoDatabaseModel() {
    databaseName = todoDbModel.databaseName;
    password = todoDbModel.password;
    dbVersion = todoDbModel.dbVersion;
    preSaveAction = todoDbModel.preSaveAction;
    logFunction = todoDbModel.logFunction;
    databaseTables = [
      TableTodo.getInstance,
    ];

    bundledDatabasePath = todoDbModel
        .bundledDatabasePath; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
    databasePath = todoDbModel.databasePath;
  }
  Map<String, dynamic> getControllers() {
    final controllers = <String, dynamic>{};

    return controllers;
  }
}
// END DATABASE MODEL

// BEGIN ENTITIES
// region Todo
class Todo extends TableBase {
  Todo(
      {this.id,
      this.title,
      this.description,
      this.pickerColor,
      this.isSelected}) {
    _setDefaultValues();
    softDeleteActivated = false;
  }
  Todo.withFields(
      this.title, this.description, this.pickerColor, this.isSelected) {
    _setDefaultValues();
  }
  Todo.withId(this.id, this.title, this.description, this.pickerColor,
      this.isSelected) {
    _setDefaultValues();
  }
  // fromMap v2.0
  Todo.fromMap(Map<String, dynamic> o, {bool setDefaultValues = true}) {
    if (setDefaultValues) {
      _setDefaultValues();
    }
    id = int.tryParse(o['id'].toString());
    if (o['title'] != null) {
      title = o['title'].toString();
    }
    if (o['description'] != null) {
      description = o['description'].toString();
    }
    if (o['pickerColor'] != null) {
      pickerColor = o['pickerColor'].toString();
    }
    if (o['isSelected'] != null) {
      isSelected = o['isSelected'].toString() == '1' ||
          o['isSelected'].toString() == 'true';
    }
  }
  // FIELDS (Todo)
  int? id;
  String? title;
  String? description;
  String? pickerColor;
  bool? isSelected;

  // end FIELDS (Todo)

  static const bool _softDeleteActivated = false;
  TodoManager? __mnTodo;

  TodoManager get _mnTodo {
    return __mnTodo = __mnTodo ?? TodoManager();
  }

  // METHODS
  @override
  Map<String, dynamic> toMap(
      {bool forQuery = false, bool forJson = false, bool forView = false}) {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (title != null || !forView) {
      map['title'] = title;
    }
    if (description != null || !forView) {
      map['description'] = description;
    }
    if (pickerColor != null || !forView) {
      map['pickerColor'] = pickerColor;
    }
    if (isSelected != null) {
      map['isSelected'] = forQuery ? (isSelected! ? 1 : 0) : isSelected;
    } else if (isSelected != null || !forView) {
      map['isSelected'] = null;
    }

    return map;
  }

  @override
  Future<Map<String, dynamic>> toMapWithChildren(
      [bool forQuery = false,
      bool forJson = false,
      bool forView = false]) async {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (title != null || !forView) {
      map['title'] = title;
    }
    if (description != null || !forView) {
      map['description'] = description;
    }
    if (pickerColor != null || !forView) {
      map['pickerColor'] = pickerColor;
    }
    if (isSelected != null) {
      map['isSelected'] = forQuery ? (isSelected! ? 1 : 0) : isSelected;
    } else if (isSelected != null || !forView) {
      map['isSelected'] = null;
    }

    return map;
  }

  /// This method returns Json String [Todo]
  @override
  String toJson() {
    return json.encode(toMap(forJson: true));
  }

  /// This method returns Json String [Todo]
  @override
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChildren(false, true));
  }

  @override
  List<dynamic> toArgs() {
    return [title, description, pickerColor, isSelected];
  }

  @override
  List<dynamic> toArgsWithIds() {
    return [id, title, description, pickerColor, isSelected];
  }

  static Future<List<Todo>?> fromWebUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      return await fromJson(response.body);
    } catch (e) {
      debugPrint(
          'SQFENTITY ERROR Todo.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  Future<http.Response> postUrl(Uri uri, {Map<String, String>? headers}) {
    return http.post(uri, headers: headers, body: toJson());
  }

  static Future<List<Todo>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = <Todo>[];
    try {
      objList = list
          .map((todo) => Todo.fromMap(todo as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint(
          'SQFENTITY ERROR Todo.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  static Future<List<Todo>> fromMapList(List<dynamic> data,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields,
      bool setDefaultValues = true}) async {
    final List<Todo> objList = <Todo>[];
    loadedFields = loadedFields ?? [];
    for (final map in data) {
      final obj = Todo.fromMap(map as Map<String, dynamic>,
          setDefaultValues: setDefaultValues);

      objList.add(obj);
    }
    return objList;
  }

  /// returns Todo by ID if exist, otherwise returns null
  /// Primary Keys: int? id
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: getById(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: getById(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns>returns [Todo] if exist, otherwise returns null
  Future<Todo?> getById(int? id,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    if (id == null) {
      return null;
    }
    Todo? obj;
    final data = await _mnTodo.getById([id]);
    if (data.length != 0) {
      obj = Todo.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// Saves the (Todo) object. If the id field is null, saves as a new record and returns new id, if id is not null then updates record
  /// ignoreBatch = true as a default. Set ignoreBatch to false if you run more than one save() operation those are between batchStart and batchCommit
  /// <returns>Returns id
  @override
  Future<int?> save({bool ignoreBatch = true}) async {
    if (id == null || id == 0) {
      id = await _mnTodo.insert(this, ignoreBatch);
    } else {
      await _mnTodo.update(this);
    }

    return id;
  }

  /// Saves the (Todo) object. If the id field is null, saves as a new record and returns new id, if id is not null then updates record
  /// ignoreBatch = true as a default. Set ignoreBatch to false if you run more than one save() operation those are between batchStart and batchCommit
  /// <returns>Returns id
  @override
  Future<int?> saveOrThrow({bool ignoreBatch = true}) async {
    if (id == null || id == 0) {
      id = await _mnTodo.insertOrThrow(this, ignoreBatch);

      isInsert = true;
    } else {
      // id= await _upsert(); // removed in sqfentity_gen 1.3.0+6
      await _mnTodo.updateOrThrow(this);
    }

    return id;
  }

  /// saveAs Todo. Returns a new Primary Key value of Todo

  /// <returns>Returns a new Primary Key value of Todo
  @override
  Future<int?> saveAs({bool ignoreBatch = true}) async {
    id = null;

    return save(ignoreBatch: ignoreBatch);
  }

  /// saveAll method saves the sent List<Todo> as a bulk in one transaction
  /// Returns a <List<BoolResult>>
  static Future<List<dynamic>> saveAll(List<Todo> todos,
      {bool? exclusive, bool? noResult, bool? continueOnError}) async {
    List<dynamic>? result = [];
    // If there is no open transaction, start one
    final isStartedBatch = await TodoDatabaseModel().batchStart();
    for (final obj in todos) {
      await obj.save(ignoreBatch: false);
    }
    if (!isStartedBatch) {
      result = await TodoDatabaseModel().batchCommit(
          exclusive: exclusive,
          noResult: noResult,
          continueOnError: continueOnError);
      for (int i = 0; i < todos.length; i++) {
        if (todos[i].id == null) {
          todos[i].id = result![i] as int;
        }
      }
    }
    return result!;
  }

  /// Updates if the record exists, otherwise adds a new row
  /// <returns>Returns id
  @override
  Future<int?> upsert({bool ignoreBatch = true}) async {
    try {
      final result = await _mnTodo.rawInsert(
          'INSERT OR REPLACE INTO todo (id, title, description, pickerColor, isSelected)  VALUES (?,?,?,?,?)',
          [id, title, description, pickerColor, isSelected],
          ignoreBatch);
      if (result! > 0) {
        saveResult = BoolResult(
            success: true, successMessage: 'Todo id=$id updated successfully');
      } else {
        saveResult = BoolResult(
            success: false, errorMessage: 'Todo id=$id did not update');
      }
      return id;
    } catch (e) {
      saveResult = BoolResult(
          success: false,
          errorMessage: 'Todo Save failed. Error: ${e.toString()}');
      return null;
    }
  }

  /// inserts or replaces the sent List<<Todo>> as a bulk in one transaction.
  /// upsertAll() method is faster then saveAll() method. upsertAll() should be used when you are sure that the primary key is greater than zero
  /// Returns a BoolCommitResult
  @override
  Future<BoolCommitResult> upsertAll(List<Todo> todos,
      {bool? exclusive, bool? noResult, bool? continueOnError}) async {
    final results = await _mnTodo.rawInsertAll(
        'INSERT OR REPLACE INTO todo (id, title, description, pickerColor, isSelected)  VALUES (?,?,?,?,?)',
        todos,
        exclusive: exclusive,
        noResult: noResult,
        continueOnError: continueOnError);
    return results;
  }

  /// Deletes Todo

  /// <returns>BoolResult res.success= true (Deleted), false (Could not be deleted)
  @override
  Future<BoolResult> delete([bool hardDelete = false]) async {
    debugPrint('SQFENTITIY: delete Todo invoked (id=$id)');
    if (!_softDeleteActivated || hardDelete) {
      return _mnTodo
          .delete(QueryParams(whereString: 'id=?', whereArguments: [id]));
    } else {
      return _mnTodo.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 1});
    }
  }

  @override
  Future<BoolResult> recover([bool recoverChilds = true]) {
    // not implemented because:
    final msg =
        'set useSoftDeleting:true in the table definition of [Todo] to use this feature';
    throw UnimplementedError(msg);
  }

  @override
  TodoFilterBuilder select(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return TodoFilterBuilder(this, getIsDeleted)
      ..qparams.selectColumns = columnsToSelect;
  }

  @override
  TodoFilterBuilder distinct(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return TodoFilterBuilder(this, getIsDeleted)
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void _setDefaultValues() {
    isSelected = isSelected ?? false;
  }

  @override
  void rollbackPk() {
    if (isInsert == true) {
      id = null;
    }
  }

  // END METHODS
  // BEGIN CUSTOM CODE
  /*
      you can define customCode property of your SqfEntityTable constant. For example:
      const tablePerson = SqfEntityTable(
      tableName: 'person',
      primaryKeyName: 'id',
      primaryKeyType: PrimaryKeyType.integer_auto_incremental,
      fields: [
        SqfEntityField('firstName', DbType.text),
        SqfEntityField('lastName', DbType.text),
      ],
      customCode: '''
       String fullName()
       { 
         return '$firstName $lastName';
       }
      ''');
     */
  // END CUSTOM CODE
}
// endregion todo

// region TodoField
class TodoField extends FilterBase {
  TodoField(TodoFilterBuilder todoFB) : super(todoFB);

  @override
  TodoFilterBuilder equals(dynamic pValue) {
    return super.equals(pValue) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder equalsOrNull(dynamic pValue) {
    return super.equalsOrNull(pValue) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder isNull() {
    return super.isNull() as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder contains(dynamic pValue) {
    return super.contains(pValue) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder startsWith(dynamic pValue) {
    return super.startsWith(pValue) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder endsWith(dynamic pValue) {
    return super.endsWith(pValue) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder between(dynamic pFirst, dynamic pLast) {
    return super.between(pFirst, pLast) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder greaterThan(dynamic pValue) {
    return super.greaterThan(pValue) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder lessThan(dynamic pValue) {
    return super.lessThan(pValue) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder greaterThanOrEquals(dynamic pValue) {
    return super.greaterThanOrEquals(pValue) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder lessThanOrEquals(dynamic pValue) {
    return super.lessThanOrEquals(pValue) as TodoFilterBuilder;
  }

  @override
  TodoFilterBuilder inValues(dynamic pValue) {
    return super.inValues(pValue) as TodoFilterBuilder;
  }

  @override
  TodoField get not {
    return super.not as TodoField;
  }
}
// endregion TodoField

// region TodoFilterBuilder
class TodoFilterBuilder extends ConjunctionBase {
  TodoFilterBuilder(Todo obj, bool? getIsDeleted) : super(obj, getIsDeleted) {
    _mnTodo = obj._mnTodo;
    _softDeleteActivated = obj.softDeleteActivated;
  }

  bool _softDeleteActivated = false;
  TodoManager? _mnTodo;

  /// put the sql keyword 'AND'
  @override
  TodoFilterBuilder get and {
    super.and;
    return this;
  }

  /// put the sql keyword 'OR'
  @override
  TodoFilterBuilder get or {
    super.or;
    return this;
  }

  /// open parentheses
  @override
  TodoFilterBuilder get startBlock {
    super.startBlock;
    return this;
  }

  /// String whereCriteria, write raw query without 'where' keyword. Like this: 'field1 like 'test%' and field2 = 3'
  @override
  TodoFilterBuilder where(String? whereCriteria, {dynamic parameterValue}) {
    super.where(whereCriteria, parameterValue: parameterValue);
    return this;
  }

  /// page = page number,
  /// pagesize = row(s) per page
  @override
  TodoFilterBuilder page(int page, int pagesize) {
    super.page(page, pagesize);
    return this;
  }

  /// int count = LIMIT
  @override
  TodoFilterBuilder top(int count) {
    super.top(count);
    return this;
  }

  /// close parentheses
  @override
  TodoFilterBuilder get endBlock {
    super.endBlock;
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='name, date'
  /// Example 2: argFields = ['name', 'date']
  @override
  TodoFilterBuilder orderBy(dynamic argFields) {
    super.orderBy(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='field1, field2'
  /// Example 2: argFields = ['field1', 'field2']
  @override
  TodoFilterBuilder orderByDesc(dynamic argFields) {
    super.orderByDesc(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='field1, field2'
  /// Example 2: argFields = ['field1', 'field2']
  @override
  TodoFilterBuilder groupBy(dynamic argFields) {
    super.groupBy(argFields);
    return this;
  }

  /// argFields might be String or List<String>.
  /// Example 1: argFields='name, date'
  /// Example 2: argFields = ['name', 'date']
  @override
  TodoFilterBuilder having(dynamic argFields) {
    super.having(argFields);
    return this;
  }

  TodoField _setField(TodoField? field, String colName, DbType dbtype) {
    return TodoField(this)
      ..param = DbParameter(
          dbType: dbtype, columnName: colName, wStartBlock: openedBlock);
  }

  TodoField? _id;
  TodoField get id {
    return _id = _setField(_id, 'id', DbType.integer);
  }

  TodoField? _title;
  TodoField get title {
    return _title = _setField(_title, 'title', DbType.text);
  }

  TodoField? _description;
  TodoField get description {
    return _description = _setField(_description, 'description', DbType.text);
  }

  TodoField? _pickerColor;
  TodoField get pickerColor {
    return _pickerColor = _setField(_pickerColor, 'pickerColor', DbType.text);
  }

  TodoField? _isSelected;
  TodoField get isSelected {
    return _isSelected = _setField(_isSelected, 'isSelected', DbType.bool);
  }

  /// Deletes List<Todo> bulk by query
  ///
  /// <returns>BoolResult res.success= true (Deleted), false (Could not be deleted)
  @override
  Future<BoolResult> delete([bool hardDelete = false]) async {
    buildParameters();
    var r = BoolResult(success: false);

    if (_softDeleteActivated && !hardDelete) {
      r = await _mnTodo!.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _mnTodo!.delete(qparams);
    }
    return r;
  }

  /// using:
  /// update({'fieldName': Value})
  /// fieldName must be String. Value is dynamic, it can be any of the (int, bool, String.. )
  @override
  Future<BoolResult> update(Map<String, dynamic> values) {
    buildParameters();
    if (qparams.limit! > 0 || qparams.offset! > 0) {
      qparams.whereString =
          'id IN (SELECT id from todo ${qparams.whereString!.isNotEmpty ? 'WHERE ${qparams.whereString}' : ''}${qparams.limit! > 0 ? ' LIMIT ${qparams.limit}' : ''}${qparams.offset! > 0 ? ' OFFSET ${qparams.offset}' : ''})';
    }
    return _mnTodo!.updateBatch(qparams, values);
  }

  /// This method always returns [Todo] Obj if exist, otherwise returns null
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toSingle(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns> Todo?
  @override
  Future<Todo?> toSingle(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    buildParameters(pSize: 1);
    final objFuture = _mnTodo!.toList(qparams);
    final data = await objFuture;
    Todo? obj;
    if (data.isNotEmpty) {
      obj = Todo.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// This method always returns [Todo]
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toSingle(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns> Todo?
  @override
  Future<Todo> toSingleOrDefault(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    return await toSingle(
            preload: preload,
            preloadFields: preloadFields,
            loadParents: loadParents,
            loadedFields: loadedFields) ??
        Todo();
  }

  /// This method returns int. [Todo]
  /// <returns>int
  @override
  Future<int> toCount([VoidCallback Function(int c)? todoCount]) async {
    buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final todosFuture = await _mnTodo!.toList(qparams);
    final int count = todosFuture[0]['CNT'] as int;
    if (todoCount != null) {
      todoCount(count);
    }
    return count;
  }

  /// This method returns List<Todo> [Todo]
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  /// ex: toList(preload:true) -> Loads all related objects
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  /// ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  /// <returns>List<Todo>
  @override
  Future<List<Todo>> toList(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    final data = await toMapList();
    final List<Todo> todosData = await Todo.fromMapList(data,
        preload: preload,
        preloadFields: preloadFields,
        loadParents: loadParents,
        loadedFields: loadedFields,
        setDefaultValues: qparams.selectColumns == null);
    return todosData;
  }

  /// This method returns Json String [Todo]
  @override
  Future<String> toJson() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap(forJson: true));
    }
    return json.encode(list);
  }

  /// This method returns Json String. [Todo]
  @override
  Future<String> toJsonWithChilds() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChildren(false, true));
    }
    return json.encode(list);
  }

  /// This method returns List<dynamic>. [Todo]
  /// <returns>List<dynamic>
  @override
  Future<List<dynamic>> toMapList() async {
    buildParameters();
    return await _mnTodo!.toList(qparams);
  }

  /// This method returns Primary Key List SQL and Parameters retVal = Map<String,dynamic>. [Todo]
  /// retVal['sql'] = SQL statement string, retVal['args'] = whereArguments List<dynamic>;
  /// <returns>List<String>
  @override
  Map<String, dynamic> toListPrimaryKeySQL([bool buildParams = true]) {
    final Map<String, dynamic> _retVal = <String, dynamic>{};
    if (buildParams) {
      buildParameters();
    }
    _retVal['sql'] = 'SELECT `id` FROM todo WHERE ${qparams.whereString}';
    _retVal['args'] = qparams.whereArguments;
    return _retVal;
  }

  /// This method returns Primary Key List<int>.
  /// <returns>List<int>
  @override
  Future<List<int>> toListPrimaryKey([bool buildParams = true]) async {
    if (buildParams) {
      buildParameters();
    }
    final List<int> idData = <int>[];
    qparams.selectColumns = ['id'];
    final idFuture = await _mnTodo!.toList(qparams);

    final int count = idFuture.length;
    for (int i = 0; i < count; i++) {
      idData.add(idFuture[i]['id'] as int);
    }
    return idData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..  [Todo]
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  @override
  Future<List<dynamic>> toListObject() async {
    buildParameters();

    final objectFuture = _mnTodo!.toList(qparams);

    final List<dynamic> objectsData = <dynamic>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  /// Sample usage: await Todo.select(columnsToSelect: ['columnName']).toListString()
  @override
  Future<List<String>> toListString(
      [VoidCallback Function(List<String> o)? listString]) async {
    buildParameters();

    final objectFuture = _mnTodo!.toList(qparams);

    final List<String> objectsData = <String>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns![0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion TodoFilterBuilder

// region TodoFields
class TodoFields {
  static TableField? _fId;
  static TableField get id {
    return _fId = _fId ?? SqlSyntax.setField(_fId, 'id', DbType.integer);
  }

  static TableField? _fTitle;
  static TableField get title {
    return _fTitle =
        _fTitle ?? SqlSyntax.setField(_fTitle, 'title', DbType.text);
  }

  static TableField? _fDescription;
  static TableField get description {
    return _fDescription = _fDescription ??
        SqlSyntax.setField(_fDescription, 'description', DbType.text);
  }

  static TableField? _fPickerColor;
  static TableField get pickerColor {
    return _fPickerColor = _fPickerColor ??
        SqlSyntax.setField(_fPickerColor, 'pickerColor', DbType.text);
  }

  static TableField? _fIsSelected;
  static TableField get isSelected {
    return _fIsSelected = _fIsSelected ??
        SqlSyntax.setField(_fIsSelected, 'isSelected', DbType.bool);
  }
}
// endregion TodoFields

//region TodoManager
class TodoManager extends SqfEntityProvider {
  TodoManager()
      : super(TodoDatabaseModel(),
            tableName: _tableName,
            primaryKeyList: _primaryKeyList,
            whereStr: _whereStr);
  static const String _tableName = 'todo';
  static const List<String> _primaryKeyList = ['id'];
  static const String _whereStr = 'id=?';
}

//endregion TodoManager
class TodoDatabaseModelSequenceManager extends SqfEntityProvider {
  TodoDatabaseModelSequenceManager() : super(TodoDatabaseModel());
}
// END OF ENTITIES
