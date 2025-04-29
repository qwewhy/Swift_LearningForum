# PostFavourControllerAPI

All URIs are relative to *http://localhost:8101/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**doPostFavourUsingPOST**](PostFavourControllerAPI.md#dopostfavourusingpost) | **POST** /api/post_favour/ | doPostFavour
[**listFavourPostByPageUsingPOST**](PostFavourControllerAPI.md#listfavourpostbypageusingpost) | **POST** /api/post_favour/list/page | listFavourPostByPage
[**listMyFavourPostByPageUsingPOST**](PostFavourControllerAPI.md#listmyfavourpostbypageusingpost) | **POST** /api/post_favour/my/list/page | listMyFavourPostByPage


# **doPostFavourUsingPOST**
```swift
    open class func doPostFavourUsingPOST(postFavourAddRequest: PostFavourAddRequest, completion: @escaping (_ data: BaseResponseint?, _ error: Error?) -> Void)
```

doPostFavour

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postFavourAddRequest = PostFavourAddRequest(postId: 123) // PostFavourAddRequest | postFavourAddRequest

// doPostFavour
PostFavourControllerAPI.doPostFavourUsingPOST(postFavourAddRequest: postFavourAddRequest) { (response, error) in
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
 **postFavourAddRequest** | [**PostFavourAddRequest**](PostFavourAddRequest.md) | postFavourAddRequest | 

### Return type

[**BaseResponseint**](BaseResponseint.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listFavourPostByPageUsingPOST**
```swift
    open class func listFavourPostByPageUsingPOST(postFavourQueryRequest: PostFavourQueryRequest, completion: @escaping (_ data: BaseResponsePagePostVO?, _ error: Error?) -> Void)
```

listFavourPostByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postFavourQueryRequest = PostFavourQueryRequest(current: 123, pageSize: 123, postQueryRequest: PostQueryRequest(content: "content_example", current: 123, favourUserId: 123, id: 123, notId: 123, orTags: ["orTags_example"], pageSize: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123), sortField: "sortField_example", sortOrder: "sortOrder_example", userId: 123) // PostFavourQueryRequest | postFavourQueryRequest

// listFavourPostByPage
PostFavourControllerAPI.listFavourPostByPageUsingPOST(postFavourQueryRequest: postFavourQueryRequest) { (response, error) in
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
 **postFavourQueryRequest** | [**PostFavourQueryRequest**](PostFavourQueryRequest.md) | postFavourQueryRequest | 

### Return type

[**BaseResponsePagePostVO**](BaseResponsePagePostVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyFavourPostByPageUsingPOST**
```swift
    open class func listMyFavourPostByPageUsingPOST(postQueryRequest: PostQueryRequest, completion: @escaping (_ data: BaseResponsePagePostVO?, _ error: Error?) -> Void)
```

listMyFavourPostByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postQueryRequest = PostQueryRequest(content: "content_example", current: 123, favourUserId: 123, id: 123, notId: 123, orTags: ["orTags_example"], pageSize: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123) // PostQueryRequest | postQueryRequest

// listMyFavourPostByPage
PostFavourControllerAPI.listMyFavourPostByPageUsingPOST(postQueryRequest: postQueryRequest) { (response, error) in
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
 **postQueryRequest** | [**PostQueryRequest**](PostQueryRequest.md) | postQueryRequest | 

### Return type

[**BaseResponsePagePostVO**](BaseResponsePagePostVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

