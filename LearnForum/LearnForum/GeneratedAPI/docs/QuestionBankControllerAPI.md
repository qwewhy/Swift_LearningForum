# QuestionBankControllerAPI

All URIs are relative to *http://localhost:8101/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addQuestionBankUsingPOST**](QuestionBankControllerAPI.md#addquestionbankusingpost) | **POST** /api/questionBank/add | addQuestionBank
[**deleteQuestionBankUsingPOST**](QuestionBankControllerAPI.md#deletequestionbankusingpost) | **POST** /api/questionBank/delete | deleteQuestionBank
[**editQuestionBankUsingPOST**](QuestionBankControllerAPI.md#editquestionbankusingpost) | **POST** /api/questionBank/edit | editQuestionBank
[**getQuestionBankVOByIdUsingGET**](QuestionBankControllerAPI.md#getquestionbankvobyidusingget) | **GET** /api/questionBank/get/vo | getQuestionBankVOById
[**listMyQuestionBankVOByPageUsingPOST**](QuestionBankControllerAPI.md#listmyquestionbankvobypageusingpost) | **POST** /api/questionBank/my/list/page/vo | listMyQuestionBankVOByPage
[**listQuestionBankByPageUsingPOST**](QuestionBankControllerAPI.md#listquestionbankbypageusingpost) | **POST** /api/questionBank/list/page | listQuestionBankByPage
[**listQuestionBankVOByPageUsingPOST**](QuestionBankControllerAPI.md#listquestionbankvobypageusingpost) | **POST** /api/questionBank/list/page/vo | listQuestionBankVOByPage
[**updateQuestionBankUsingPOST**](QuestionBankControllerAPI.md#updatequestionbankusingpost) | **POST** /api/questionBank/update | updateQuestionBank


# **addQuestionBankUsingPOST**
```swift
    open class func addQuestionBankUsingPOST(questionBankAddRequest: QuestionBankAddRequest, completion: @escaping (_ data: BaseResponselong?, _ error: Error?) -> Void)
```

addQuestionBank

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankAddRequest = QuestionBankAddRequest(description: "description_example", picture: "picture_example", title: "title_example") // QuestionBankAddRequest | questionBankAddRequest

// addQuestionBank
QuestionBankControllerAPI.addQuestionBankUsingPOST(questionBankAddRequest: questionBankAddRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionBankAddRequest** | [**QuestionBankAddRequest**](QuestionBankAddRequest.md) | questionBankAddRequest | 

### Return type

[**BaseResponselong**](BaseResponselong.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteQuestionBankUsingPOST**
```swift
    open class func deleteQuestionBankUsingPOST(deleteRequest: DeleteRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

deleteQuestionBank

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let deleteRequest = DeleteRequest(id: 123) // DeleteRequest | deleteRequest

// deleteQuestionBank
QuestionBankControllerAPI.deleteQuestionBankUsingPOST(deleteRequest: deleteRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deleteRequest** | [**DeleteRequest**](DeleteRequest.md) | deleteRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **editQuestionBankUsingPOST**
```swift
    open class func editQuestionBankUsingPOST(questionBankEditRequest: QuestionBankEditRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

editQuestionBank

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankEditRequest = QuestionBankEditRequest(description: "description_example", id: 123, picture: "picture_example", title: "title_example") // QuestionBankEditRequest | questionBankEditRequest

// editQuestionBank
QuestionBankControllerAPI.editQuestionBankUsingPOST(questionBankEditRequest: questionBankEditRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionBankEditRequest** | [**QuestionBankEditRequest**](QuestionBankEditRequest.md) | questionBankEditRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getQuestionBankVOByIdUsingGET**
```swift
    open class func getQuestionBankVOByIdUsingGET(current: Int? = nil, description: String? = nil, id: Int64? = nil, needQueryQuestionList: Bool? = nil, notId: Int64? = nil, pageSize: Int? = nil, picture: String? = nil, searchText: String? = nil, sortField: String? = nil, sortOrder: String? = nil, title: String? = nil, userId: Int64? = nil, completion: @escaping (_ data: BaseResponseQuestionBankVO?, _ error: Error?) -> Void)
```

getQuestionBankVOById

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let current = 987 // Int |  (optional)
let description = "description_example" // String |  (optional)
let id = 987 // Int64 |  (optional)
let needQueryQuestionList = true // Bool |  (optional)
let notId = 987 // Int64 |  (optional)
let pageSize = 987 // Int |  (optional)
let picture = "picture_example" // String |  (optional)
let searchText = "searchText_example" // String |  (optional)
let sortField = "sortField_example" // String |  (optional)
let sortOrder = "sortOrder_example" // String |  (optional)
let title = "title_example" // String |  (optional)
let userId = 987 // Int64 |  (optional)

// getQuestionBankVOById
QuestionBankControllerAPI.getQuestionBankVOByIdUsingGET(current: current, description: description, id: id, needQueryQuestionList: needQueryQuestionList, notId: notId, pageSize: pageSize, picture: picture, searchText: searchText, sortField: sortField, sortOrder: sortOrder, title: title, userId: userId) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **current** | **Int** |  | [optional] 
 **description** | **String** |  | [optional] 
 **id** | **Int64** |  | [optional] 
 **needQueryQuestionList** | **Bool** |  | [optional] 
 **notId** | **Int64** |  | [optional] 
 **pageSize** | **Int** |  | [optional] 
 **picture** | **String** |  | [optional] 
 **searchText** | **String** |  | [optional] 
 **sortField** | **String** |  | [optional] 
 **sortOrder** | **String** |  | [optional] 
 **title** | **String** |  | [optional] 
 **userId** | **Int64** |  | [optional] 

### Return type

[**BaseResponseQuestionBankVO**](BaseResponseQuestionBankVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyQuestionBankVOByPageUsingPOST**
```swift
    open class func listMyQuestionBankVOByPageUsingPOST(questionBankQueryRequest: QuestionBankQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestionBankVO?, _ error: Error?) -> Void)
```

listMyQuestionBankVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQueryRequest = QuestionBankQueryRequest(current: 123, description: "description_example", id: 123, needQueryQuestionList: false, notId: 123, pageSize: 123, picture: "picture_example", searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", title: "title_example", userId: 123) // QuestionBankQueryRequest | questionBankQueryRequest

// listMyQuestionBankVOByPage
QuestionBankControllerAPI.listMyQuestionBankVOByPageUsingPOST(questionBankQueryRequest: questionBankQueryRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionBankQueryRequest** | [**QuestionBankQueryRequest**](QuestionBankQueryRequest.md) | questionBankQueryRequest | 

### Return type

[**BaseResponsePageQuestionBankVO**](BaseResponsePageQuestionBankVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listQuestionBankByPageUsingPOST**
```swift
    open class func listQuestionBankByPageUsingPOST(questionBankQueryRequest: QuestionBankQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestionBank?, _ error: Error?) -> Void)
```

listQuestionBankByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQueryRequest = QuestionBankQueryRequest(current: 123, description: "description_example", id: 123, needQueryQuestionList: false, notId: 123, pageSize: 123, picture: "picture_example", searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", title: "title_example", userId: 123) // QuestionBankQueryRequest | questionBankQueryRequest

// listQuestionBankByPage
QuestionBankControllerAPI.listQuestionBankByPageUsingPOST(questionBankQueryRequest: questionBankQueryRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionBankQueryRequest** | [**QuestionBankQueryRequest**](QuestionBankQueryRequest.md) | questionBankQueryRequest | 

### Return type

[**BaseResponsePageQuestionBank**](BaseResponsePageQuestionBank.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listQuestionBankVOByPageUsingPOST**
```swift
    open class func listQuestionBankVOByPageUsingPOST(questionBankQueryRequest: QuestionBankQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestionBankVO?, _ error: Error?) -> Void)
```

listQuestionBankVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQueryRequest = QuestionBankQueryRequest(current: 123, description: "description_example", id: 123, needQueryQuestionList: false, notId: 123, pageSize: 123, picture: "picture_example", searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", title: "title_example", userId: 123) // QuestionBankQueryRequest | questionBankQueryRequest

// listQuestionBankVOByPage
QuestionBankControllerAPI.listQuestionBankVOByPageUsingPOST(questionBankQueryRequest: questionBankQueryRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionBankQueryRequest** | [**QuestionBankQueryRequest**](QuestionBankQueryRequest.md) | questionBankQueryRequest | 

### Return type

[**BaseResponsePageQuestionBankVO**](BaseResponsePageQuestionBankVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateQuestionBankUsingPOST**
```swift
    open class func updateQuestionBankUsingPOST(questionBankUpdateRequest: QuestionBankUpdateRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

updateQuestionBank

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankUpdateRequest = QuestionBankUpdateRequest(description: "description_example", id: 123, picture: "picture_example", title: "title_example") // QuestionBankUpdateRequest | questionBankUpdateRequest

// updateQuestionBank
QuestionBankControllerAPI.updateQuestionBankUsingPOST(questionBankUpdateRequest: questionBankUpdateRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **questionBankUpdateRequest** | [**QuestionBankUpdateRequest**](QuestionBankUpdateRequest.md) | questionBankUpdateRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

