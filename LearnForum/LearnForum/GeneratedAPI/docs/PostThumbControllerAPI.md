# PostThumbControllerAPI

All URIs are relative to *http://localhost:8101/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**doThumbUsingPOST**](PostThumbControllerAPI.md#dothumbusingpost) | **POST** /api/post_thumb/ | doThumb


# **doThumbUsingPOST**
```swift
    open class func doThumbUsingPOST(postThumbAddRequest: PostThumbAddRequest, completion: @escaping (_ data: BaseResponseint?, _ error: Error?) -> Void)
```

doThumb

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postThumbAddRequest = PostThumbAddRequest(postId: 123) // PostThumbAddRequest | postThumbAddRequest

// doThumb
PostThumbControllerAPI.doThumbUsingPOST(postThumbAddRequest: postThumbAddRequest) { (response, error) in
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
 **postThumbAddRequest** | [**PostThumbAddRequest**](PostThumbAddRequest.md) | postThumbAddRequest | 

### Return type

[**BaseResponseint**](BaseResponseint.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

