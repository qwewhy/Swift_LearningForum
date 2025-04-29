# WxMpControllerAPI

All URIs are relative to *http://localhost:8101/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkUsingGET**](WxMpControllerAPI.md#checkusingget) | **GET** /api/ | check
[**receiveMessageUsingPOST**](WxMpControllerAPI.md#receivemessageusingpost) | **POST** /api/ | receiveMessage
[**setMenuUsingGET**](WxMpControllerAPI.md#setmenuusingget) | **GET** /api/setMenu | setMenu


# **checkUsingGET**
```swift
    open class func checkUsingGET(echostr: String? = nil, nonce: String? = nil, signature: String? = nil, timestamp: String? = nil, completion: @escaping (_ data: String?, _ error: Error?) -> Void)
```

check

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let echostr = "echostr_example" // String | echostr (optional)
let nonce = "nonce_example" // String | nonce (optional)
let signature = "signature_example" // String | signature (optional)
let timestamp = "timestamp_example" // String | timestamp (optional)

// check
WxMpControllerAPI.checkUsingGET(echostr: echostr, nonce: nonce, signature: signature, timestamp: timestamp) { (response, error) in
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
 **echostr** | **String** | echostr | [optional] 
 **nonce** | **String** | nonce | [optional] 
 **signature** | **String** | signature | [optional] 
 **timestamp** | **String** | timestamp | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **receiveMessageUsingPOST**
```swift
    open class func receiveMessageUsingPOST(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

receiveMessage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient


// receiveMessage
WxMpControllerAPI.receiveMessageUsingPOST() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setMenuUsingGET**
```swift
    open class func setMenuUsingGET(completion: @escaping (_ data: String?, _ error: Error?) -> Void)
```

setMenu

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient


// setMenu
WxMpControllerAPI.setMenuUsingGET() { (response, error) in
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
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

