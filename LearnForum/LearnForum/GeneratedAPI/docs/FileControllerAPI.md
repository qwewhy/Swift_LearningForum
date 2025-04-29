# FileControllerAPI

All URIs are relative to *http://localhost:8101/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**uploadFileUsingPOST**](FileControllerAPI.md#uploadfileusingpost) | **POST** /api/file/upload | uploadFile


# **uploadFileUsingPOST**
```swift
    open class func uploadFileUsingPOST(file: URL, biz: String? = nil, completion: @escaping (_ data: BaseResponsestring?, _ error: Error?) -> Void)
```

uploadFile

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let file = URL(string: "https://example.com")! // URL | file
let biz = "biz_example" // String |  (optional)

// uploadFile
FileControllerAPI.uploadFileUsingPOST(file: file, biz: biz) { (response, error) in
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
 **file** | **URL** | file | 
 **biz** | **String** |  | [optional] 

### Return type

[**BaseResponsestring**](BaseResponsestring.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

