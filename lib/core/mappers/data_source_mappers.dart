import '../../util/enums/filter_group.dart';

class DatabaseResponseMappers{


  /// Base query map
  static Map<String, dynamic> baseQueryDatabase(
      {required List<Map<String, dynamic>> properties,
        required FilterGroup filterGroup}) {
    return {
      "filter": {filterGroup.name: properties},
    };
  }

  /// This method used inside baseQueryDatabase() only
  static Map<String, dynamic> queryTextProperty(
      {required String propName, required String filtrationText}) {
    return {
      'property': propName,
      'rich_text': {'contains': filtrationText}
    };
  }

  static Map<String, dynamic> modelToJson({required String databaseId, required List<Map<String, dynamic>> properties}){
    Map<String, dynamic> propertiesToJson = properties.fold({}, (map, item) => {
      ...map,
      ...item,
    });
    return <String, dynamic>{
      "parent": {
        "database_id": databaseId,
      },
      "properties": {...propertiesToJson}
    };
  }


  /// Json to String

  static String jsonToId({required Map<String, dynamic> json}){
    return json['remoteId']['formula']['string'];
  }

  static String? jsonToString({required Map<String, dynamic> json, required String name}){
    final richText = json[name]['rich_text'] as List;
    return richText.isNotEmpty
        ? richText.first['plain_text'] as String
        : null;
  }

  static List<String>? jsonToListOfStrings({required Map<String, dynamic> json, required String name}){
    final richText = json[name]['rich_text'] as List;
    return richText.isNotEmpty ? (richText.first['plain_text'] as String).split(',').toList() : null;
  }

  static bool jsonToBool({required Map<String, dynamic> json, required String name}){
    print('json from here : ${json[name]} and ${json[name]['checkbox']}');
    return json[name]['checkbox'];
  }

  static DateTime? jsonToDate({required Map<String, dynamic> json, required String name}){
    return (json[name]['rich_text'] as List).isNotEmpty ? DateTime.parse( json[name]['rich_text'][0]['plain_text'] as String) : null;
  }


  /// String to json

  static Map<String, dynamic> stringPropertyToJson({required String name, required String? value}){
    return {
      name: {
        "rich_text": value != null
            ? [
          {
            "text": {"content": value}
          }
        ]
            : []
      }
    };
  }

  static Map<String, dynamic> idPropertyToJson({required String value}){
    return {
      "id": {
        "type": "formula",
        "formula": {
          "type": "string",
          "string": value
        }
      }
    };
  }

  static Map<String, dynamic> datePropertyToJson({required String name, required DateTime? value}){
    return {
      name: {
        "rich_text": value != null
            ? [
          {
            "text": {"content": value.toString()}
          }
        ]
            : []
      }
    };
  }


  static Map<String, dynamic> checkboxPropertyToJson({required String name, required bool value}){
    return {
      name: {
        "checkbox": value
      }
    };
  }

  static Map<String, dynamic> listOfStringPropertyToJson({required String name, required List<String>? value}){
    return {
      name: {
        "rich_text":
        (value != null && value.isNotEmpty)
            ? [
          {
            "text": {
              "content": value.map((e) => e).toList().join(','),
            }
          }
        ]
            :
        [],
      }
    };
  }


}