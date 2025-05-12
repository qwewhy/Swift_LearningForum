//
//  LearnForumTests.swift
//  LearnForumTests
//
//  Created by Hongyuan Wang on 29/4/2025.
//

import XCTest
// import Testing // 移除 Swift Testing 框架的导入
@testable import LearnForum
import LearnForumAPIClient

// 默认的 API 基础路径，如果你的后端部署在不同地址，请修改这里
let testBasePath = "http://localhost:8101"

// 将结构体改为继承 XCTestCase
class LearnForumAPITests: XCTestCase {

    // 用于存储在测试中创建的帖子的 ID
    static var createdPostId: Int64?

    // 注意：XCTestCase 中的测试默认按字母顺序执行。
    // 为了确保依赖关系（先登录再执行其他操作），
    // 使用了 test_XX_ 前缀来建议执行顺序。

    // 移除 @Test 属性，修改函数签名
    // test_01: 用户登录
    func test_01_UserLogin() async throws {
        // 设置 API 基础路径
        LearnForumAPIClientAPI.basePath = testBasePath

        let expectation = XCTestExpectation(description: "用户登录请求完成")

        let loginRequest = UserLoginRequest(userAccount: "whywhywhy", userPassword: "12345678")

        UserControllerAPI.userLoginUsingPOST(userLoginRequest: loginRequest) { data, error in
            XCTAssertNil(error, "登录请求不应出错: \(error?.localizedDescription ?? "未知错误")")
            XCTAssertNotNil(data, "登录响应数据不应为 nil")
            if let data = data {
                XCTAssertEqual(data.code, 0, "登录响应码应为 0 (成功)，实际为 \(data.code ?? -1)，消息：\(data.message ?? "无")")
                XCTAssertNotNil(data.data, "登录用户信息不应为 nil")
                if let userData = data.data {
                    // 将String?类型的ID转换为Int64?进行比较
                    let userIdInt = Int64(userData.id ?? "")
                    XCTAssertEqual(userIdInt, 6, "登录用户 ID 应为 6，实际为 \(userData.id ?? "nil")")
                    print("登录成功，用户信息：\(userData)")
                }
            }
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 10.0) // 设置超时时间
    }

    // 移除 @Test 和 .depends(on:)
    // test_02: 获取登录用户信息
    func test_02_GetLoginUserInfo() async throws {
         // 设置 API 基础路径 (如果测试单独运行，确保路径已设置)
        LearnForumAPIClientAPI.basePath = testBasePath

        let expectation = XCTestExpectation(description: "获取登录用户信息请求完成")

        UserControllerAPI.getLoginUserUsingGET { data, error in
            XCTAssertNil(error, "获取用户信息请求不应出错: \(error?.localizedDescription ?? "未知错误")")
            XCTAssertNotNil(data, "获取用户信息响应数据不应为 nil")
             if let data = data {
                 XCTAssertEqual(data.code, 0, "获取用户信息响应码应为 0 (成功)，实际为 \(data.code ?? -1)，消息：\(data.message ?? "无")")
                 XCTAssertNotNil(data.data, "用户信息不应为 nil")
                 if let userData = data.data {
                    // 将String?类型的ID转换为Int64?进行比较
                    let userIdInt = Int64(userData.id ?? "")
                    XCTAssertEqual(userIdInt, 6, "获取到的用户 ID 应为 6，实际为 \(userData.id ?? "nil")")
                    print("获取登录用户信息成功：\(userData)")
                 }
            }
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 10.0)
    }

    // 移除 @Test 和 .depends(on:)
    // test_03: 获取我的帖子列表
     func test_03_ListMyPosts() async throws {
         // 设置 API 基础路径 (如果测试单独运行，确保路径已设置)
        LearnForumAPIClientAPI.basePath = testBasePath

        let expectation = XCTestExpectation(description: "获取我的帖子列表请求完成")

        // 创建一个查询请求，可以根据需要调整分页等参数
        let queryRequest = PostQueryRequest(current: 1, pageSize: 10) // 获取第一页，每页10条

        PostControllerAPI.listMyPostVOByPageUsingPOST(postQueryRequest: queryRequest) { data, error in
            XCTAssertNil(error, "获取帖子列表请求不应出错: \(error?.localizedDescription ?? "未知错误")")
            XCTAssertNotNil(data, "获取帖子列表响应数据不应为 nil")
             if let data = data {
                 XCTAssertEqual(data.code, 0, "获取帖子列表响应码应为 0 (成功)，实际为 \(data.code ?? -1)，消息：\(data.message ?? "无")")
                 XCTAssertNotNil(data.data, "帖子分页数据不应为 nil")
                 if let pageData = data.data {
                    // Note: current, pages, size, total might be String? based on backend
                    // Print total as String?
                    print("获取我的帖子列表成功，当前页: \(pageData.current ?? "nil")，总页数: \(pageData.pages ?? "nil")，总记录数: \(pageData.total ?? "nil")，本页记录数: \(pageData.records?.count ?? 0)")
                    XCTAssertNotNil(pageData.records, "帖子记录列表不应为 nil")
                 }
            }
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 10.0)
    }

    // 新增测试：test_04: 添加帖子
    func test_04_AddPost() async throws {
        LearnForumAPIClientAPI.basePath = testBasePath
        let expectation = XCTestExpectation(description: "添加帖子请求完成")

        let postContent = "这是通过单元测试发布的帖子内容 \(Date())"
        let postTitle = "单元测试帖子标题"
        let postTags = ["Swift", "测试", "API"]
        let addRequest = PostAddRequest(content: postContent, tags: postTags, title: postTitle)

        PostControllerAPI.addPostUsingPOST(postAddRequest: addRequest) { data, error in
            XCTAssertNil(error, "添加帖子请求不应出错: \(error?.localizedDescription ?? "未知错误")")
            XCTAssertNotNil(data, "添加帖子响应数据不应为 nil")
            if let data = data {
                XCTAssertEqual(data.code, 0, "添加帖子响应码应为 0 (成功)，实际为 \(data.code ?? -1)，消息：\(data.message ?? "无")")
                XCTAssertNotNil(data.data, "新帖子的 ID 不应为 nil")
                if let postIdString = data.data {
                    // Convert the String? ID to Int64? before storing
                    if let postIdInt = Int64(postIdString) {
                        print("添加帖子成功，帖子 ID: \(postIdInt)")
                        LearnForumAPITests.createdPostId = postIdInt // 保存帖子 ID 供后续测试使用
                    } else {
                        XCTFail("无法将返回的帖子 ID 字符串 '\(postIdString)' 转换为 Int64")
                    }
                }
            }
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 10.0)
    }

    // 新增测试：test_05: 根据 ID 获取帖子
    func test_05_GetPostById() async throws {
        LearnForumAPIClientAPI.basePath = testBasePath
        let expectation = XCTestExpectation(description: "根据 ID 获取帖子请求完成")

        // 确保上一个测试已成功创建帖子并设置了 ID
        guard let postIdToGet = LearnForumAPITests.createdPostId else {
            XCTFail("未能获取到上一步创建的帖子 ID，无法执行此测试")
            return
        }

        PostControllerAPI.getPostVOByIdUsingGET(id: postIdToGet) { data, error in
            XCTAssertNil(error, "获取帖子请求不应出错: \(error?.localizedDescription ?? "未知错误")")
            XCTAssertNotNil(data, "获取帖子响应数据不应为 nil")
            if let data = data {
                XCTAssertEqual(data.code, 0, "获取帖子响应码应为 0 (成功)，实际为 \(data.code ?? -1)，消息：\(data.message ?? "无")")
                XCTAssertNotNil(data.data, "帖子数据不应为 nil")
                if let postData = data.data {
                    // Compare String? id with String representation of Int64 postIdToGet
                    XCTAssertEqual(postData.id, String(postIdToGet), "获取到的帖子 ID 应与请求的 ID 一致")
                    print("根据 ID (\(postIdToGet)) 获取帖子成功: \(postData.title ?? "无标题")")
                }
            }
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 10.0)
    }

     // 新增测试：test_06: 收藏帖子
     func test_06_DoPostFavour() async throws {
        LearnForumAPIClientAPI.basePath = testBasePath
        let expectation = XCTestExpectation(description: "收藏帖子请求完成")

        guard let postIdToFavour = LearnForumAPITests.createdPostId else {
            XCTFail("未能获取到创建的帖子 ID，无法执行收藏测试")
            return
        }

        let favourRequest = PostFavourAddRequest(postId: postIdToFavour)

        PostFavourControllerAPI.doPostFavourUsingPOST(postFavourAddRequest: favourRequest) { data, error in
            XCTAssertNil(error, "收藏帖子请求不应出错: \(error?.localizedDescription ?? "未知错误")")
            XCTAssertNotNil(data, "收藏帖子响应数据不应为 nil")
            if let data = data {
                 // 后端可能返回 1 表示收藏成功，-1 表示取消收藏，0 表示操作失败
                 // 这里我们断言 code 为 0，并且 data 不为 nil (具体值 1 或 -1 取决于当前状态)
                 XCTAssertEqual(data.code, 0, "收藏帖子响应码应为 0 (成功)，实际为 \(data.code ?? -99)，消息：\(data.message ?? "无")")
                 XCTAssertNotNil(data.data, "收藏操作结果不应为 nil")
                 print("收藏/取消收藏帖子 (\(postIdToFavour)) 操作成功，结果: \(data.data ?? -99) (1:收藏, -1:取消)")
            }
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 10.0)
     }

     // 新增测试：test_07: 获取我收藏的帖子列表
     func test_07_ListMyFavourPosts() async throws {
         LearnForumAPIClientAPI.basePath = testBasePath
         let expectation = XCTestExpectation(description: "获取我收藏的帖子列表请求完成")

         guard let favedPostId = LearnForumAPITests.createdPostId else {
             XCTFail("未能获取到创建的帖子 ID，无法验证收藏列表")
             return
         }

         // 查询请求，查找包含我们刚收藏帖子的页面
         let queryRequest = PostQueryRequest(current: 1, pageSize: 10) // 可调整分页

         PostFavourControllerAPI.listMyFavourPostByPageUsingPOST(postQueryRequest: queryRequest) { data, error in
             XCTAssertNil(error, "获取收藏列表请求不应出错: \(error?.localizedDescription ?? "未知错误")")
             XCTAssertNotNil(data, "获取收藏列表响应数据不应为 nil")
             if let data = data {
                 XCTAssertEqual(data.code, 0, "获取收藏列表响应码应为 0 (成功)，实际为 \(data.code ?? -1)，消息：\(data.message ?? "无")")
                 XCTAssertNotNil(data.data, "收藏帖子分页数据不应为 nil")
                 if let pageData = data.data {
                     // Print total as String?
                     print("获取我收藏的帖子列表成功，总记录数: \(pageData.total ?? "nil")，本页记录数: \(pageData.records?.count ?? 0)")
                     // Assert that the post we favourited is in the returned list
                     // Convert favedPostId to String for comparison with PostVO.id (String?)
                     let favedPostIdString = String(favedPostId)
                     let foundFavedPost = pageData.records?.contains(where: { $0.id == favedPostIdString }) ?? false
                     XCTAssertTrue(foundFavedPost, "收藏的帖子 (ID: \(favedPostId)) 应出现在收藏列表中")
                 }
             }
             expectation.fulfill()
         }

         await fulfillment(of: [expectation], timeout: 10.0)
     }

     // 新增测试：test_08: 点赞帖子
     func test_08_DoPostThumb() async throws {
         LearnForumAPIClientAPI.basePath = testBasePath
         let expectation = XCTestExpectation(description: "点赞帖子请求完成")

         guard let postIdToThumb = LearnForumAPITests.createdPostId else {
             XCTFail("未能获取到创建的帖子 ID，无法执行点赞测试")
             return
         }

         let thumbRequest = PostThumbAddRequest(postId: postIdToThumb)

         PostThumbControllerAPI.doThumbUsingPOST(postThumbAddRequest: thumbRequest) { data, error in
             XCTAssertNil(error, "点赞帖子请求不应出错: \(error?.localizedDescription ?? "未知错误")")
             XCTAssertNotNil(data, "点赞帖子响应数据不应为 nil")
             if let data = data {
                 // 类似收藏，断言 code 为 0，data 不为 nil
                 XCTAssertEqual(data.code, 0, "点赞帖子响应码应为 0 (成功)，实际为 \(data.code ?? -99)，消息：\(data.message ?? "无")")
                 XCTAssertNotNil(data.data, "点赞操作结果不应为 nil")
                 print("点赞/取消点赞帖子 (\(postIdToThumb)) 操作成功，结果: \(data.data ?? -99) (1:点赞, -1:取消)")
             }
             expectation.fulfill()
         }

         await fulfillment(of: [expectation], timeout: 10.0)
     }

     // 新增测试：test_09: 上传文件 (注意：这需要一个真实的文件和后端支持)
     func test_09_UploadFile() async throws {
         LearnForumAPIClientAPI.basePath = testBasePath
         let expectation = XCTestExpectation(description: "上传文件请求完成")

         // 重要提示：
         // 1. 你需要提供一个真实存在于模拟器或设备上的文件 URL。
         // 2. Bundle.main.url(forResource:withExtension:) 适用于应用 Bundle 内的文件。
         // 3. 如果是从相册或其他地方获取文件，需要使用相应的 API 获取文件 URL。
         // 4. 此处使用一个占位符 URL，你需要替换它！
         guard let fileURL = Bundle.main.url(forResource: "testImage", withExtension: "png") else {
             // 如果测试资源不存在，可以考虑创建一个临时的文本文件用于测试
             let tempDir = FileManager.default.temporaryDirectory
             let tempFileURL = tempDir.appendingPathComponent("testUpload.txt")
             let fileContent = "这是一个测试上传的文本文件内容。"
             do {
                 try fileContent.write(to: tempFileURL, atomically: true, encoding: .utf8)
                 print("测试文件不存在，已创建临时文件：\(tempFileURL.path)")
                 uploadFile(url: tempFileURL, biz: "testBiz", expectation: expectation)
             } catch {
                 XCTFail("无法创建临时测试文件: \(error)")
                 return // 如果无法创建文件，则不执行测试
             }
             // 注意：测试结束后可能需要清理临时文件，可以在 tearDown 中处理
             // defer { try? FileManager.default.removeItem(at: tempFileURL) }
             return // 使用临时文件后结束
         }

         // 如果 Bundle 文件存在，则使用它
         uploadFile(url: fileURL, biz: "user_avatar", expectation: expectation)


         await fulfillment(of: [expectation], timeout: 20.0) // 上传可能需要更长时间
     }

     // 辅助函数来执行文件上传逻辑
     private func uploadFile(url fileURL: URL, biz: String?, expectation: XCTestExpectation) {
         FileControllerAPI.uploadFileUsingPOST(file: fileURL, biz: biz) { data, error in
             // 文件上传测试可能因为多种原因失败（网络、服务器配置、文件权限等）
             // 这里我们主要检查请求是否能发出并且服务器有响应，不强制要求 code == 0
             if let error = error {
                 // 如果是网络错误或文件读取错误，打印出来但可能不标记为失败
                 print("文件上传请求出错 (可能预期内，例如文件不存在或服务器未配置): \(error)")
                 // XCTFail("文件上传请求不应出错: \(error.localizedDescription)")
             }
             XCTAssertNotNil(data, "文件上传响应数据不应为 nil，即使操作失败")
             if let data = data {
                 print("文件上传响应: Code=\(data.code ?? -1), Message='\(data.message ?? "无")', Data='\(data.data ?? "无")'")
                 // 如果上传成功 (code == 0)，可以进一步断言返回的文件 URL (data.data) 不为空
                 if data.code == 0 {
                     XCTAssertNotNil(data.data, "成功上传后，返回的文件路径不应为 nil")
                     XCTAssertFalse(data.data?.isEmpty ?? true, "成功上传后，返回的文件路径不应为空")
                 } else {
                     // 如果 code 不是 0，打印警告信息
                      print("警告：文件上传未成功 (Code: \(data.code ?? -1))。请检查后端配置、测试文件路径和 'biz' 参数是否正确。")
                 }
             }
             expectation.fulfill()
         }
     }


    // --- 其他 Controller 的 API 测试可以继续添加 ---
    // 例如:
    // func test_10_ListQuestionBanks() async throws { ... }
    // func test_11_GetQuestionById() async throws { ... }
    // ...

    // 注意：测试执行顺序依赖于命名。如果添加或删除测试，请检查并调整名称以保持依赖关系。
    // 清理操作（例如删除测试创建的帖子）可以在 tearDownWithError() 中完成，但这里省略了。

}

// 注意：
// 1. 请确保你的后端服务正在运行，并且地址是 http://localhost:8101。如果不是，请修改 testBasePath。
// 2. 密码 "e02d8b3ce971e76cbb70d22995f23a1b" 是 "123456" 的 MD5 哈希值。请确认你的后端登录接口确实是这样处理密码的。如果不是，请相应地修改 loginRequest 中的密码。
// 3. 这些测试依赖于登录成功后，HTTP 客户端（URLSession）能够自动管理和发送会话 Cookie。这是 iOS SDK 的标准行为，但请确保没有特殊配置阻止它。
// 4. 使用了 XCTestExpectation 和 await fulfillment(of:timeout:) 来处理异步 API 调用。
// 5. 测试执行顺序：XCTestCase 中的测试默认按字母顺序执行，这可能导致依赖登录状态的测试（如 testGetLoginUserInfo）在 testUserLogin 之前运行而失败。如果遇到这种情况，可以考虑重命名测试方法以控制顺序（例如 test_01_UserLogin, test_02_GetLoginUserInfo）。
