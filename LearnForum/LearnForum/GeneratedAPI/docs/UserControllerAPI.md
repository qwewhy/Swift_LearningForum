# UserControllerAPI

All URIs are relative to *http://localhost:8101/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addUserSignInUsingPOST**](UserControllerAPI.md#addusersigninusingpost) | **POST** /api/user/add/sign_in | addUserSignIn
[**addUserUsingPOST**](UserControllerAPI.md#adduserusingpost) | **POST** /api/user/add | addUser
[**deleteUserUsingPOST**](UserControllerAPI.md#deleteuserusingpost) | **POST** /api/user/delete | deleteUser
[**getLoginUserUsingGET**](UserControllerAPI.md#getloginuserusingget) | **GET** /api/user/get/login | getLoginUser
[**getUserByIdUsingGET**](UserControllerAPI.md#getuserbyidusingget) | **GET** /api/user/get | getUserById
[**getUserSignInRecordUsingGET**](UserControllerAPI.md#getusersigninrecordusingget) | **GET** /api/user/get/sign_in | getUserSignInRecord
[**getUserVOByIdUsingGET**](UserControllerAPI.md#getuservobyidusingget) | **GET** /api/user/get/vo | getUserVOById
[**listUserByPageUsingPOST**](UserControllerAPI.md#listuserbypageusingpost) | **POST** /api/user/list/page | listUserByPage
[**listUserVOByPageUsingPOST**](UserControllerAPI.md#listuservobypageusingpost) | **POST** /api/user/list/page/vo | listUserVOByPage
[**updateMyUserUsingPOST**](UserControllerAPI.md#updatemyuserusingpost) | **POST** /api/user/update/my | updateMyUser
[**updateUserUsingPOST**](UserControllerAPI.md#updateuserusingpost) | **POST** /api/user/update | updateUser
[**userLoginByWxOpenUsingGET**](UserControllerAPI.md#userloginbywxopenusingget) | **GET** /api/user/login/wx_open | userLoginByWxOpen
[**userLoginUsingPOST**](UserControllerAPI.md#userloginusingpost) | **POST** /api/user/login | userLogin
[**userLogoutUsingPOST**](UserControllerAPI.md#userlogoutusingpost) | **POST** /api/user/logout | userLogout
[**userRegisterUsingPOST**](UserControllerAPI.md#userregisterusingpost) | **POST** /api/user/register | userRegister


# **addUserSignInUsingPOST**
```swift
    open class func addUserSignInUsingPOST(completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

addUserSignIn

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient


// addUserSignIn
UserControllerAPI.addUserSignInUsingPOST() { (response, error) in
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

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **addUserUsingPOST**
```swift
    open class func addUserUsingPOST(userAddRequest: UserAddRequest, completion: @escaping (_ data: BaseResponselong?, _ error: Error?) -> Void)
```

addUser

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let userAddRequest = UserAddRequest(userAccount: "userAccount_example", userAvatar: "userAvatar_example", userName: "userName_example", userRole: "userRole_example") // UserAddRequest | userAddRequest

// addUser
UserControllerAPI.addUserUsingPOST(userAddRequest: userAddRequest) { (response, error) in
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
 **userAddRequest** | [**UserAddRequest**](UserAddRequest.md) | userAddRequest | 

### Return type

[**BaseResponselong**](BaseResponselong.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUserUsingPOST**
```swift
    open class func deleteUserUsingPOST(deleteRequest: DeleteRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

deleteUser

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let deleteRequest = DeleteRequest(id: 123) // DeleteRequest | deleteRequest

// deleteUser
UserControllerAPI.deleteUserUsingPOST(deleteRequest: deleteRequest) { (response, error) in
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

# **getLoginUserUsingGET**
```swift
    open class func getLoginUserUsingGET(completion: @escaping (_ data: BaseResponseLoginUserVO?, _ error: Error?) -> Void)
```

getLoginUser

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient


// getLoginUser
UserControllerAPI.getLoginUserUsingGET() { (response, error) in
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

[**BaseResponseLoginUserVO**](BaseResponseLoginUserVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserByIdUsingGET**
```swift
    open class func getUserByIdUsingGET(id: Int64? = nil, completion: @escaping (_ data: BaseResponseUser?, _ error: Error?) -> Void)
```

getUserById

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let id = 987 // Int64 | id (optional)

// getUserById
UserControllerAPI.getUserByIdUsingGET(id: id) { (response, error) in
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

[**BaseResponseUser**](BaseResponseUser.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserSignInRecordUsingGET**
```swift
    open class func getUserSignInRecordUsingGET(year: Int? = nil, completion: @escaping (_ data: BaseResponseListint?, _ error: Error?) -> Void)
```

getUserSignInRecord

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let year = 987 // Int | year (optional)

// getUserSignInRecord
UserControllerAPI.getUserSignInRecordUsingGET(year: year) { (response, error) in
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
 **year** | **Int** | year | [optional] 

### Return type

[**BaseResponseListint**](BaseResponseListint.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserVOByIdUsingGET**
```swift
    open class func getUserVOByIdUsingGET(id: Int64? = nil, completion: @escaping (_ data: BaseResponseUserVO?, _ error: Error?) -> Void)
```

getUserVOById

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let id = 987 // Int64 | id (optional)

// getUserVOById
UserControllerAPI.getUserVOByIdUsingGET(id: id) { (response, error) in
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

[**BaseResponseUserVO**](BaseResponseUserVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUserByPageUsingPOST**
```swift
    open class func listUserByPageUsingPOST(userQueryRequest: UserQueryRequest, completion: @escaping (_ data: BaseResponsePageUser?, _ error: Error?) -> Void)
```

listUserByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let userQueryRequest = UserQueryRequest(current: 123, id: 123, mpOpenId: "mpOpenId_example", pageSize: 123, sortField: "sortField_example", sortOrder: "sortOrder_example", unionId: "unionId_example", userName: "userName_example", userProfile: "userProfile_example", userRole: "userRole_example") // UserQueryRequest | userQueryRequest

// listUserByPage
UserControllerAPI.listUserByPageUsingPOST(userQueryRequest: userQueryRequest) { (response, error) in
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
 **userQueryRequest** | [**UserQueryRequest**](UserQueryRequest.md) | userQueryRequest | 

### Return type

[**BaseResponsePageUser**](BaseResponsePageUser.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUserVOByPageUsingPOST**
```swift
    open class func listUserVOByPageUsingPOST(userQueryRequest: UserQueryRequest, completion: @escaping (_ data: BaseResponsePageUserVO?, _ error: Error?) -> Void)
```

listUserVOByPage

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let userQueryRequest = UserQueryRequest(current: 123, id: 123, mpOpenId: "mpOpenId_example", pageSize: 123, sortField: "sortField_example", sortOrder: "sortOrder_example", unionId: "unionId_example", userName: "userName_example", userProfile: "userProfile_example", userRole: "userRole_example") // UserQueryRequest | userQueryRequest

// listUserVOByPage
UserControllerAPI.listUserVOByPageUsingPOST(userQueryRequest: userQueryRequest) { (response, error) in
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
 **userQueryRequest** | [**UserQueryRequest**](UserQueryRequest.md) | userQueryRequest | 

### Return type

[**BaseResponsePageUserVO**](BaseResponsePageUserVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMyUserUsingPOST**
```swift
    open class func updateMyUserUsingPOST(userUpdateMyRequest: UserUpdateMyRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

updateMyUser

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let userUpdateMyRequest = UserUpdateMyRequest(userAvatar: "userAvatar_example", userName: "userName_example", userProfile: "userProfile_example") // UserUpdateMyRequest | userUpdateMyRequest

// updateMyUser
UserControllerAPI.updateMyUserUsingPOST(userUpdateMyRequest: userUpdateMyRequest) { (response, error) in
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
 **userUpdateMyRequest** | [**UserUpdateMyRequest**](UserUpdateMyRequest.md) | userUpdateMyRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUserUsingPOST**
```swift
    open class func updateUserUsingPOST(userUpdateRequest: UserUpdateRequest, completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

updateUser

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let userUpdateRequest = UserUpdateRequest(id: 123, userAvatar: "userAvatar_example", userName: "userName_example", userProfile: "userProfile_example", userRole: "userRole_example") // UserUpdateRequest | userUpdateRequest

// updateUser
UserControllerAPI.updateUserUsingPOST(userUpdateRequest: userUpdateRequest) { (response, error) in
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
 **userUpdateRequest** | [**UserUpdateRequest**](UserUpdateRequest.md) | userUpdateRequest | 

### Return type

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userLoginByWxOpenUsingGET**
```swift
    open class func userLoginByWxOpenUsingGET(code: String, completion: @escaping (_ data: BaseResponseLoginUserVO?, _ error: Error?) -> Void)
```

userLoginByWxOpen

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let code = "code_example" // String | code

// userLoginByWxOpen
UserControllerAPI.userLoginByWxOpenUsingGET(code: code) { (response, error) in
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
 **code** | **String** | code | 

### Return type

[**BaseResponseLoginUserVO**](BaseResponseLoginUserVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userLoginUsingPOST**
```swift
    open class func userLoginUsingPOST(userLoginRequest: UserLoginRequest, completion: @escaping (_ data: BaseResponseLoginUserVO?, _ error: Error?) -> Void)
```

userLogin

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let userLoginRequest = UserLoginRequest(userAccount: "userAccount_example", userPassword: "userPassword_example") // UserLoginRequest | userLoginRequest

// userLogin
UserControllerAPI.userLoginUsingPOST(userLoginRequest: userLoginRequest) { (response, error) in
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
 **userLoginRequest** | [**UserLoginRequest**](UserLoginRequest.md) | userLoginRequest | 

### Return type

[**BaseResponseLoginUserVO**](BaseResponseLoginUserVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userLogoutUsingPOST**
```swift
    open class func userLogoutUsingPOST(completion: @escaping (_ data: BaseResponseboolean?, _ error: Error?) -> Void)
```

userLogout

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient


// userLogout
UserControllerAPI.userLogoutUsingPOST() { (response, error) in
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

[**BaseResponseboolean**](BaseResponseboolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userRegisterUsingPOST**
```swift
    open class func userRegisterUsingPOST(userRegisterRequest: UserRegisterRequest, completion: @escaping (_ data: BaseResponselong?, _ error: Error?) -> Void)
```

userRegister

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import LearnForumAPIClient

let userRegisterRequest = UserRegisterRequest(checkPassword: "checkPassword_example", userAccount: "userAccount_example", userPassword: "userPassword_example") // UserRegisterRequest | userRegisterRequest

// userRegister
UserControllerAPI.userRegisterUsingPOST(userRegisterRequest: userRegisterRequest) { (response, error) in
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
 **userRegisterRequest** | [**UserRegisterRequest**](UserRegisterRequest.md) | userRegisterRequest | 

### Return type

[**BaseResponselong**](BaseResponselong.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

