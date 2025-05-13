# LearnForum - Swift学习论坛应用

LearnForum是一个iOS应用程序，为学习论坛提供移动端支持。该应用集成了学习论坛后端API，实现了问题库浏览、用户认证、问题详情查看等功能。

## 项目介绍

本项目是一个基于Swift开发的iOS应用，主要实现了与学习论坛后端的API集成。应用支持用户登录注册、问题库浏览、问题详情查看、问题搜索、评论互动等功能。

## 系统要求

- iOS 15.0+
- Xcode 14.0+
- Swift 5.7+

## 安装方法

1. 克隆仓库
2. 使用Xcode打开`LearnForum.xcodeproj`
3. 应用使用基于OpenAPI规范预生成的API客户端

## API配置

应用配置连接到后端API服务器:
- API基础URL: http://43.165.196.25:8101
- API基础URL可在`LearnForumApp.swift`中修改

## 主要功能

- **用户系统**：支持用户注册、登录和退出
- **问题库功能**：浏览问题库列表，查看问题库详情
- **问题查询**：搜索和浏览问题列表
- **问题详情**：查看问题详细内容和答案
- **评论功能**：为问题添加和查看评论
- **用户中心**：查看个人资料和签到记录
- **图片缓存**：实现图片加载缓存机制

## 项目结构

- `LearnForumApp.swift`: 应用入口和API客户端配置
- `ContentView.swift`: 主要内容视图和导航控制
- `LoginView.swift`: 用户登录和注册界面
- `QuestionBankView.swift`: 问题库列表和详情视图
- `AskQuestionView.swift`: 问题搜索功能
- `QuestionDetailView.swift`: 问题详情和答案展示
- `UserProfileView.swift`: 用户个人资料页面
- `ImageCache.swift`: 图片缓存实现
- `SettingsView.swift`: 应用设置界面

## 问题处理

如果遇到API连接问题:
1. 确认API服务器运行正常
2. 检查`LearnForumApp.swift`中的基础URL是否正确
3. 查看Xcode控制台的错误消息

## 开发团队

- **qwewhy**: Hongyuan Wang
- **kyrie**: Jingyu Deng
- **ryin**: Yanao Kong
- **yuxing**: Yuxing Ren 