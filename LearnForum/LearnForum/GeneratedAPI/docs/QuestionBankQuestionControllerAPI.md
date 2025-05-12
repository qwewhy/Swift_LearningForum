# QuestionBankQuestionControllerAPI

All URIs are relative to *http://localhost:8101/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addQuestionBankQuestionUsingPOST**](QuestionBankQuestionControllerAPI.md#addquestionbankquestionusingpost) | **POST** /api/questionBankQuestion/add | addQuestionBankQuestion
[**batchAddQuestionsToBankUsingPOST**](QuestionBankQuestionControllerAPI.md#batchaddquestionstobankusingpost) | **POST** /api/questionBankQuestion/add/batch | batchAddQuestionsToBank
[**batchRemoveQuestionsToBankUsingPOST**](QuestionBankQuestionControllerAPI.md#batchremovequestionstobankusingpost) | **POST** /api/questionBankQuestion/remove/batch | batchRemoveQuestionsToBank
[**deleteQuestionBankQuestionUsingPOST**](QuestionBankQuestionControllerAPI.md#deletequestionbankquestionusingpost) | **POST** /api/questionBankQuestion/delete | deleteQuestionBankQuestion
[**getQuestionBankQuestionVOByIdUsingGET**](QuestionBankQuestionControllerAPI.md#getquestionbankquestionvobyidusingget) | **GET** /api/questionBankQuestion/get/vo | getQuestionBankQuestionVOById
[**listMyQuestionBankQuestionVOByPageUsingPOST**](QuestionBankQuestionControllerAPI.md#listmyquestionbankquestionvobypageusingpost) | **POST** /api/questionBankQuestion/my/list/page/vo | listMyQuestionBankQuestionVOByPage
[**listQuestionBankQuestionByPageUsingPOST**](QuestionBankQuestionControllerAPI.md#listquestionbankquestionbypageusingpost) | **POST** /api/questionBankQuestion/list/page | listQuestionBankQuestionByPage
[**listQuestionBankQuestionVOByPageUsingPOST**](QuestionBankQuestionControllerAPI.md#listquestionbankquestionvobypageusingpost) | **POST** /api/questionBankQuestion/list/page/vo | listQuestionBankQuestionVOByPage
[**updateQuestionBankQuestionUsingPOST**](QuestionBankQuestionControllerAPI.md#updatequestionbankquestionusingpost) | **POST** /api/questionBankQuestion/update | updateQuestionBankQuestion


# **addQuestionBankQuestionUsingPOST**
```swift
    open class func addQuestionBankQuestionUsingPOST(questionBankQuestionAddRequest: QuestionBankQuestionAddRequest, completion: @escaping (_ data: BaseResponselong?, _ error: Error?) -> Void)
```

addQuestionBankQuestion

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQuestionAddRequest = QuestionBankQuestionAddRequest(questionBankId: 123, questionId: 123) // QuestionBankQuestionAddRequest | questionBankQuestionAddRequest

// addQuestionBankQuestion
QuestionBankQuestionControllerAPI.addQuestionBankQuestionUsingPOST(questionBankQuestionAddRequest: questionBankQuestionAddRequest) { (response, error) in
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
 **questionBankQuestionAddRequest** | [**QuestionBankQuestionAddRequest**](QuestionBankQuestionAddRequest.md) | questionBankQuestionAddRequest | 

### Return type

[**BaseResponselong**](BaseResponselong.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **batchAddQuestionsToBankUsingPOST**
```swift
    open class func batchAddQuestionsToBankUsingPOST(questionBankQuestionBatchAddRequest: QuestionBankQuestionBatchAddRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

batchAddQuestionsToBank

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQuestionBatchAddRequest = QuestionBankQuestionBatchAddRequest(questionBankId: 123, questionIdList: [123]) // QuestionBankQuestionBatchAddRequest | questionBankQuestionBatchAddRequest

// batchAddQuestionsToBank
QuestionBankQuestionControllerAPI.batchAddQuestionsToBankUsingPOST(questionBankQuestionBatchAddRequest: questionBankQuestionBatchAddRequest) { (response, error) in
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
 **questionBankQuestionBatchAddRequest** | [**QuestionBankQuestionBatchAddRequest**](QuestionBankQuestionBatchAddRequest.md) | questionBankQuestionBatchAddRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **batchRemoveQuestionsToBankUsingPOST**
```swift
    open class func batchRemoveQuestionsToBankUsingPOST(questionBankQuestionBatchAddRequest: QuestionBankQuestionBatchAddRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

batchRemoveQuestionsToBank

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQuestionBatchAddRequest = QuestionBankQuestionBatchAddRequest(questionBankId: 123, questionIdList: [123]) // QuestionBankQuestionBatchAddRequest | questionBankQuestionBatchAddRequest

// batchRemoveQuestionsToBank
QuestionBankQuestionControllerAPI.batchRemoveQuestionsToBankUsingPOST(questionBankQuestionBatchAddRequest: questionBankQuestionBatchAddRequest) { (response, error) in
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
 **questionBankQuestionBatchAddRequest** | [**QuestionBankQuestionBatchAddRequest**](QuestionBankQuestionBatchAddRequest.md) | questionBankQuestionBatchAddRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteQuestionBankQuestionUsingPOST**
```swift
    open class func deleteQuestionBankQuestionUsingPOST(deleteRequest: DeleteRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

deleteQuestionBankQuestion

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let deleteRequest = DeleteRequest(id: 123) // DeleteRequest | deleteRequest

// deleteQuestionBankQuestion
QuestionBankQuestionControllerAPI.deleteQuestionBankQuestionUsingPOST(deleteRequest: deleteRequest) { (response, error) in
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

# **getQuestionBankQuestionVOByIdUsingGET**
```swift
    open class func getQuestionBankQuestionVOByIdUsingGET(id: Int64? = nil, completion: @escaping (_ data: BaseResponseQuestionBankQuestionVO?, _ error: Error?) -> Void)
```

getQuestionBankQuestionVOById

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let id = 987 // Int64 | id (optional)

// getQuestionBankQuestionVOById
QuestionBankQuestionControllerAPI.getQuestionBankQuestionVOByIdUsingGET(id: id) { (response, error) in
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

[**BaseResponseQuestionBankQuestionVO**](BaseResponseQuestionBankQuestionVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyQuestionBankQuestionVOByPageUsingPOST**
```swift
    open class func listMyQuestionBankQuestionVOByPageUsingPOST(questionBankQuestionQueryRequest: QuestionBankQuestionQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestionBankQuestionVO?, _ error: Error?) -> Void)
```

listMyQuestionBankQuestionVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQuestionQueryRequest = QuestionBankQuestionQueryRequest(current: 123, id: 123, notId: 123, pageSize: 123, questionBankId: 123, questionId: 123, sortField: "sortField_example", sortOrder: "sortOrder_example", userId: 123) // QuestionBankQuestionQueryRequest | questionBankQuestionQueryRequest

// listMyQuestionBankQuestionVOByPage
QuestionBankQuestionControllerAPI.listMyQuestionBankQuestionVOByPageUsingPOST(questionBankQuestionQueryRequest: questionBankQuestionQueryRequest) { (response, error) in
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
 **questionBankQuestionQueryRequest** | [**QuestionBankQuestionQueryRequest**](QuestionBankQuestionQueryRequest.md) | questionBankQuestionQueryRequest | 

### Return type

[**BaseResponsePageQuestionBankQuestionVO**](BaseResponsePageQuestionBankQuestionVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listQuestionBankQuestionByPageUsingPOST**
```swift
    open class func listQuestionBankQuestionByPageUsingPOST(questionBankQuestionQueryRequest: QuestionBankQuestionQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestionBankQuestion?, _ error: Error?) -> Void)
```

listQuestionBankQuestionByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQuestionQueryRequest = QuestionBankQuestionQueryRequest(current: 123, id: 123, notId: 123, pageSize: 123, questionBankId: 123, questionId: 123, sortField: "sortField_example", sortOrder: "sortOrder_example", userId: 123) // QuestionBankQuestionQueryRequest | questionBankQuestionQueryRequest

// listQuestionBankQuestionByPage
QuestionBankQuestionControllerAPI.listQuestionBankQuestionByPageUsingPOST(questionBankQuestionQueryRequest: questionBankQuestionQueryRequest) { (response, error) in
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
 **questionBankQuestionQueryRequest** | [**QuestionBankQuestionQueryRequest**](QuestionBankQuestionQueryRequest.md) | questionBankQuestionQueryRequest | 

### Return type

[**BaseResponsePageQuestionBankQuestion**](BaseResponsePageQuestionBankQuestion.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listQuestionBankQuestionVOByPageUsingPOST**
```swift
    open class func listQuestionBankQuestionVOByPageUsingPOST(questionBankQuestionQueryRequest: QuestionBankQuestionQueryRequest, completion: @escaping (_ data: BaseResponsePageQuestionBankQuestionVO?, _ error: Error?) -> Void)
```

listQuestionBankQuestionVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQuestionQueryRequest = QuestionBankQuestionQueryRequest(current: 123, id: 123, notId: 123, pageSize: 123, questionBankId: 123, questionId: 123, sortField: "sortField_example", sortOrder: "sortOrder_example", userId: 123) // QuestionBankQuestionQueryRequest | questionBankQuestionQueryRequest

// listQuestionBankQuestionVOByPage
QuestionBankQuestionControllerAPI.listQuestionBankQuestionVOByPageUsingPOST(questionBankQuestionQueryRequest: questionBankQuestionQueryRequest) { (response, error) in
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
 **questionBankQuestionQueryRequest** | [**QuestionBankQuestionQueryRequest**](QuestionBankQuestionQueryRequest.md) | questionBankQuestionQueryRequest | 

### Return type

[**BaseResponsePageQuestionBankQuestionVO**](BaseResponsePageQuestionBankQuestionVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateQuestionBankQuestionUsingPOST**
```swift
    open class func updateQuestionBankQuestionUsingPOST(questionBankQuestionUpdateRequest: QuestionBankQuestionUpdateRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

updateQuestionBankQuestion

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let questionBankQuestionUpdateRequest = QuestionBankQuestionUpdateRequest(id: 123, questionBankId: 123, questionId: 123) // QuestionBankQuestionUpdateRequest | questionBankQuestionUpdateRequest

// updateQuestionBankQuestion
QuestionBankQuestionControllerAPI.updateQuestionBankQuestionUsingPOST(questionBankQuestionUpdateRequest: questionBankQuestionUpdateRequest) { (response, error) in
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
 **questionBankQuestionUpdateRequest** | [**QuestionBankQuestionUpdateRequest**](QuestionBankQuestionUpdateRequest.md) | questionBankQuestionUpdateRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

