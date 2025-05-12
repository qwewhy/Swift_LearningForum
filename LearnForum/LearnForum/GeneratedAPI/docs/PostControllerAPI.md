# PostControllerAPI

All URIs are relative to *http://localhost:8101/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addPostUsingPOST**](PostControllerAPI.md#addpostusingpost) | **POST** /api/post/add | addPost
[**deletePostUsingPOST**](PostControllerAPI.md#deletepostusingpost) | **POST** /api/post/delete | deletePost
[**editPostUsingPOST**](PostControllerAPI.md#editpostusingpost) | **POST** /api/post/edit | editPost
[**getPostVOByIdUsingGET**](PostControllerAPI.md#getpostvobyidusingget) | **GET** /api/post/get/vo | getPostVOById
[**listMyPostVOByPageUsingPOST**](PostControllerAPI.md#listmypostvobypageusingpost) | **POST** /api/post/my/list/page/vo | listMyPostVOByPage
[**listPostByPageUsingPOST**](PostControllerAPI.md#listpostbypageusingpost) | **POST** /api/post/list/page | listPostByPage
[**listPostVOByPageUsingPOST**](PostControllerAPI.md#listpostvobypageusingpost) | **POST** /api/post/list/page/vo | listPostVOByPage
[**searchPostVOByPageUsingPOST**](PostControllerAPI.md#searchpostvobypageusingpost) | **POST** /api/post/search/page/vo | searchPostVOByPage
[**updatePostUsingPOST**](PostControllerAPI.md#updatepostusingpost) | **POST** /api/post/update | updatePost


# **addPostUsingPOST**
```swift
    open class func addPostUsingPOST(postAddRequest: PostAddRequest, completion: @escaping (_ data: BaseResponselong?, _ error: Error?) -> Void)
```

addPost

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postAddRequest = PostAddRequest(content: "content_example", tags: ["tags_example"], title: "title_example") // PostAddRequest | postAddRequest

// addPost
PostControllerAPI.addPostUsingPOST(postAddRequest: postAddRequest) { (response, error) in
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
 **postAddRequest** | [**PostAddRequest**](PostAddRequest.md) | postAddRequest | 

### Return type

[**BaseResponselong**](BaseResponselong.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePostUsingPOST**
```swift
    open class func deletePostUsingPOST(deleteRequest: DeleteRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

deletePost

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let deleteRequest = DeleteRequest(id: 123) // DeleteRequest | deleteRequest

// deletePost
PostControllerAPI.deletePostUsingPOST(deleteRequest: deleteRequest) { (response, error) in
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

# **editPostUsingPOST**
```swift
    open class func editPostUsingPOST(postEditRequest: PostEditRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

editPost

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postEditRequest = PostEditRequest(content: "content_example", id: 123, tags: ["tags_example"], title: "title_example") // PostEditRequest | postEditRequest

// editPost
PostControllerAPI.editPostUsingPOST(postEditRequest: postEditRequest) { (response, error) in
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
 **postEditRequest** | [**PostEditRequest**](PostEditRequest.md) | postEditRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPostVOByIdUsingGET**
```swift
    open class func getPostVOByIdUsingGET(id: Int64? = nil, completion: @escaping (_ data: BaseResponsePostVO?, _ error: Error?) -> Void)
```

getPostVOById

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let id = 987 // Int64 | id (optional)

// getPostVOById
PostControllerAPI.getPostVOByIdUsingGET(id: id) { (response, error) in
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

[**BaseResponsePostVO**](BaseResponsePostVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMyPostVOByPageUsingPOST**
```swift
    open class func listMyPostVOByPageUsingPOST(postQueryRequest: PostQueryRequest, completion: @escaping (_ data: BaseResponsePagePostVO?, _ error: Error?) -> Void)
```

listMyPostVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postQueryRequest = PostQueryRequest(content: "content_example", current: 123, favourUserId: 123, id: 123, notId: 123, orTags: ["orTags_example"], pageSize: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123) // PostQueryRequest | postQueryRequest

// listMyPostVOByPage
PostControllerAPI.listMyPostVOByPageUsingPOST(postQueryRequest: postQueryRequest) { (response, error) in
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

# **listPostByPageUsingPOST**
```swift
    open class func listPostByPageUsingPOST(postQueryRequest: PostQueryRequest, completion: @escaping (_ data: BaseResponsePagePost?, _ error: Error?) -> Void)
```

listPostByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postQueryRequest = PostQueryRequest(content: "content_example", current: 123, favourUserId: 123, id: 123, notId: 123, orTags: ["orTags_example"], pageSize: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123) // PostQueryRequest | postQueryRequest

// listPostByPage
PostControllerAPI.listPostByPageUsingPOST(postQueryRequest: postQueryRequest) { (response, error) in
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

[**BaseResponsePagePost**](BaseResponsePagePost.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPostVOByPageUsingPOST**
```swift
    open class func listPostVOByPageUsingPOST(postQueryRequest: PostQueryRequest, completion: @escaping (_ data: BaseResponsePagePostVO?, _ error: Error?) -> Void)
```

listPostVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postQueryRequest = PostQueryRequest(content: "content_example", current: 123, favourUserId: 123, id: 123, notId: 123, orTags: ["orTags_example"], pageSize: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123) // PostQueryRequest | postQueryRequest

// listPostVOByPage
PostControllerAPI.listPostVOByPageUsingPOST(postQueryRequest: postQueryRequest) { (response, error) in
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

# **searchPostVOByPageUsingPOST**
```swift
    open class func searchPostVOByPageUsingPOST(postQueryRequest: PostQueryRequest, completion: @escaping (_ data: BaseResponsePagePostVO?, _ error: Error?) -> Void)
```

searchPostVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postQueryRequest = PostQueryRequest(content: "content_example", current: 123, favourUserId: 123, id: 123, notId: 123, orTags: ["orTags_example"], pageSize: 123, searchText: "searchText_example", sortField: "sortField_example", sortOrder: "sortOrder_example", tags: ["tags_example"], title: "title_example", userId: 123) // PostQueryRequest | postQueryRequest

// searchPostVOByPage
PostControllerAPI.searchPostVOByPageUsingPOST(postQueryRequest: postQueryRequest) { (response, error) in
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

# **updatePostUsingPOST**
```swift
    open class func updatePostUsingPOST(postUpdateRequest: PostUpdateRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

updatePost

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let postUpdateRequest = PostUpdateRequest(content: "content_example", id: 123, tags: ["tags_example"], title: "title_example") // PostUpdateRequest | postUpdateRequest

// updatePost
PostControllerAPI.updatePostUsingPOST(postUpdateRequest: postUpdateRequest) { (response, error) in
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
 **postUpdateRequest** | [**PostUpdateRequest**](PostUpdateRequest.md) | postUpdateRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

