# QuestionControllerAPI

All URIs are relative to *http://localhost:8101/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addQuestionUsingPOST**](QuestionControllerAPI.md#addquestionusingpost) | **POST** /api/question/add | addQuestion
[**batchDeleteQuestionUsingPOST**](QuestionControllerAPI.md#batchdeletequestionusingpost) | **POST** /api/question/delete/batch | batchDeleteQuestion
[**deleteQuestionUsingPOST**](QuestionControllerAPI.md#deletequestionusingpost) | **POST** /api/question/delete | deleteQuestion
[**editQuestionUsingPOST**](QuestionControllerAPI.md#editquestionusingpost) | **POST** /api/question/edit | editQuestion
[**getQuestionVOByIdUsingGET**](QuestionControllerAPI.md#getquestionvobyidusingget) | **GET** /api/question/get/vo | getQuestionVOById
[**listMyQuestionVOByPageUsingPOST**](QuestionControllerAPI.md#listmyquestionvobypageusingpost) | **POST** /api/question/my/list/page/vo | listMyQuestionVOByPage
[**listQuestionByPageUsingPOST**](QuestionControllerAPI.md#listquestionbypageusingpost) | **POST** /api/question/list/page | listQuestionByPage
[**listQuestionVOByPageUsingPOST**](QuestionControllerAPI.md#listquestionvobypageusingpost) | **POST** /api/question/list/page/vo | listQuestionVOByPage
[**searchQuestionVOByPageUsingPOST**](QuestionControllerAPI.md#searchquestionvobypageusingpost) | **POST** /api/question/search/page/vo | searchQuestionVOByPage
[**updateQuestionUsingPOST**](QuestionControllerAPI.md#updatequestionusingpost) | **POST** /api/question/update | updateQuestion


# **addQuestionUsingPOST**
```swift
    open class func addQuestionUsingPOST(questionAddRequest: QuestionAddRequest, completion: @escaping (_ data: BaseResponselong?, _ error: Error?) -> Void)
```

addQuestion

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionAddRequest = QuestionAddRequest(answer: "answer_example", content: "content_example", tags: ["tags_example"], title: "title_example") // QuestionAddRequest | questionAddRequest

// addQuestion
QuestionControllerAPI.addQuestionUsingPOST(questionAddRequest: questionAddRequest) { (response, error) in
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
 **questionAddRequest** | [**QuestionAddRequest**](QuestionAddRequest.md) | questionAddRequest | 

### Return type

[**BaseResponselong**](BaseResponselong.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **batchDeleteQuestionUsingPOST**
```swift
    open class func batchDeleteQuestionUsingPOST(questionBatchDeleteRequest: QuestionBatchDeleteRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

batchDeleteQuestion

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBatchDeleteRequest = QuestionBatchDeleteRequest(questionIdList: [123]) // QuestionBatchDeleteRequest | questionBatchDeleteRequest

// batchDeleteQuestion
QuestionControllerAPI.batchDeleteQuestionUsingPOST(questionBatchDeleteRequest: questionBatchDeleteRequest) { (response, error) in
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
 **questionBatchDeleteRequest** | [**QuestionBatchDeleteRequest**](QuestionBatchDeleteRequest.md) | questionBatchDeleteRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteQuestionUsingPOST**
```swift
    open class func deleteQuestionUsingPOST(deleteRequest: DeleteRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

deleteQuestion

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let deleteRequest = DeleteRequest(id: 123) // DeleteRequest | deleteRequest

// deleteQuestion
QuestionControllerAPI.deleteQuestionUsingPOST(deleteRequest: deleteRequest) { (response, error) in
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

# **editQuestionUsingPOST**
```swift
    open class func editQuestionUsingPOST(questionEditRequest: QuestionEditRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

editQuestion

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionEditRequest = QuestionEditRequest(answer: "answer_example", content: "content_example", id: 123, tags: ["tags_example"], title: "title_example") // QuestionEditRequest | questionEditRequest

// editQuestion
QuestionControllerAPI.editQuestionUsingPOST(questionEditRequest: questionEditRequest) { (response, error) in
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
 **questionEditRequest** | [**QuestionEditRequest**](QuestionEditRequest.md) | questionEditRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getQuestionVOByIdUsingGET**
```swift
    open class func getQuestionVOByIdUsingGET(id: Int64? = nil, completion: @escaping (_ data: BaseResponseQuestionVO?, _ error: Error?) -> Void)
```

getQuestionVOById

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let id = 987 // Int64 | id (optional)

// getQuestionVOById
QuestionControllerAPI.getQuestionVOByIdUsingGET(id: id) { (response, error) in
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
 **id** | **Int64** | id | [optional] 

### Return type

[**BaseResponseQuestionVO**](BaseResponseQuestionVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyQuestionVOByPageUsingPOST**
```swift
    open class func listMyQuestionVOByPageUsingPOST(questionQueryRequest: QuestionQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestionVO?, _ error: Error?) -> Void)
```

listMyQuestionVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionQueryRequest = QuestionQueryRequest(answer: "answer_example", content: "content_example", current: 123, id: 123, notId: 123, pageSize: 123, questionBankId: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123) // QuestionQueryRequest | questionQueryRequest

// listMyQuestionVOByPage
QuestionControllerAPI.listMyQuestionVOByPageUsingPOST(questionQueryRequest: questionQueryRequest) { (response, error) in
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
 **questionQueryRequest** | [**QuestionQueryRequest**](QuestionQueryRequest.md) | questionQueryRequest | 

### Return type

[**BaseResponsePageQuestionVO**](BaseResponsePageQuestionVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listQuestionByPageUsingPOST**
```swift
    open class func listQuestionByPageUsingPOST(questionQueryRequest: QuestionQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestion?, _ error: Error?) -> Void)
```

listQuestionByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionQueryRequest = QuestionQueryRequest(answer: "answer_example", content: "content_example", current: 123, id: 123, notId: 123, pageSize: 123, questionBankId: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123) // QuestionQueryRequest | questionQueryRequest

// listQuestionByPage
QuestionControllerAPI.listQuestionByPageUsingPOST(questionQueryRequest: questionQueryRequest) { (response, error) in
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
 **questionQueryRequest** | [**QuestionQueryRequest**](QuestionQueryRequest.md) | questionQueryRequest | 

### Return type

[**BaseResponsePageQuestion**](BaseResponsePageQuestion.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listQuestionVOByPageUsingPOST**
```swift
    open class func listQuestionVOByPageUsingPOST(questionQueryRequest: QuestionQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestionVO?, _ error: Error?) -> Void)
```

listQuestionVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionQueryRequest = QuestionQueryRequest(answer: "answer_example", content: "content_example", current: 123, id: 123, notId: 123, pageSize: 123, questionBankId: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123) // QuestionQueryRequest | questionQueryRequest

// listQuestionVOByPage
QuestionControllerAPI.listQuestionVOByPageUsingPOST(questionQueryRequest: questionQueryRequest) { (response, error) in
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
 **questionQueryRequest** | [**QuestionQueryRequest**](QuestionQueryRequest.md) | questionQueryRequest | 

### Return type

[**BaseResponsePageQuestionVO**](BaseResponsePageQuestionVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchQuestionVOByPageUsingPOST**
```swift
    open class func searchQuestionVOByPageUsingPOST(questionQueryRequest: QuestionQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestionVO?, _ error: Error?) -> Void)
```

searchQuestionVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionQueryRequest = QuestionQueryRequest(answer: "answer_example", content: "content_example", current: 123, id: 123, notId: 123, pageSize: 123, questionBankId: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123) // QuestionQueryRequest | questionQueryRequest

// searchQuestionVOByPage
QuestionControllerAPI.searchQuestionVOByPageUsingPOST(questionQueryRequest: questionQueryRequest) { (response, error) in
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
 **questionQueryRequest** | [**QuestionQueryRequest**](QuestionQueryRequest.md) | questionQueryRequest | 

### Return type

[**BaseResponsePageQuestionVO**](BaseResponsePageQuestionVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateQuestionUsingPOST**
```swift
    open class func updateQuestionUsingPOST(questionUpdateRequest: QuestionUpdateRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

updateQuestion

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionUpdateRequest = QuestionUpdateRequest(answer: "answer_example", content: "content_example", id: 123, tags: ["tags_example"], title: "title_example") // QuestionUpdateRequest | questionUpdateRequest

// updateQuestion
QuestionControllerAPI.updateQuestionUsingPOST(questionUpdateRequest: questionUpdateRequest) { (response, error) in
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
 **questionUpdateRequest** | [**QuestionUpdateRequest**](QuestionUpdateRequest.md) | questionUpdateRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

