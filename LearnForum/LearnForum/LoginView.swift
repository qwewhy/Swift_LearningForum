import SwiftUI
import LearnForumAPIClient

struct LoginView: View {
    @State private var userAccount: String = ""
    @State private var userPassword: String = ""
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    @State private var showRegister = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // 标题
                Text("Learning Forum")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                // 登录表单
                VStack(spacing: 20) {
                    // 账号输入框
                    TextField("Username", text: $userAccount)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                        .keyboardType(.default)
                    
                    // 密码输入框
                    SecureField("Password", text: $userPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    // 错误信息展示
                    if let error = errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.callout)
                    }
                    
                    // 登录按钮
                    Button(action: login) {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Login")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(isLoading)
                    
                    // 注册按钮
                    Button(action: { showRegister = true }) {
                        Text("No account? Register now")
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .sheet(isPresented: $showRegister) {
                RegisterView(isPresented: $showRegister, onRegisterSuccess: {
                    // 注册成功后，可以选择自动登录或者返回登录页
                })
            }
        }
    }
    
    // 登录方法
    private func login() {
        isLoading = true
        errorMessage = nil
        
        // 创建登录请求
        let loginRequest = UserLoginRequest(
            userAccount: userAccount,
            userPassword: userPassword
        )
        
        // 调用API
        UserControllerAPI.userLoginUsingPOST(userLoginRequest: loginRequest) { response, error in
            isLoading = false
            
            if let error = error {
                errorMessage = "Login failed: \(error.localizedDescription)"
                return
            }
            
            guard let response = response else {
                errorMessage = "Login failed: No server response"
                return
            }
            
            if let code = response.code, code == 0 {
                // 登录成功
                if let userData = response.data {
                    // 发送登录成功通知
                    NotificationCenter.default.post(name: .userLoggedIn, object: userData)
                }
            } else {
                // 登录失败
                errorMessage = response.message ?? "Login failed, please check your username and password"
            }
        }
    }
}

// 注册视图
struct RegisterView: View {
    @Binding var isPresented: Bool
    var onRegisterSuccess: () -> Void
    
    @State private var userAccount: String = ""
    @State private var userPassword: String = ""
    @State private var checkPassword: String = ""
    @State private var isLoading = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Create New Account")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                VStack(spacing: 20) {
                    TextField("Username", text: $userAccount)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $userPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    SecureField("Confirm Password", text: $checkPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    if let error = errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.callout)
                    }
                    
                    Button(action: register) {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Text("Register")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .disabled(isLoading)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        isPresented = false
                    }
                }
            }
        }
    }
    
    // 注册方法
    private func register() {
        if userPassword != checkPassword {
            errorMessage = "Passwords do not match"
            return
        }
        
        if userAccount.isEmpty || userPassword.isEmpty {
            errorMessage = "Username and password cannot be empty"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        // 创建注册请求
        let registerRequest = UserRegisterRequest(
            checkPassword: checkPassword,
            userAccount: userAccount,
            userPassword: userPassword
        )
        
        // 调用API
        UserControllerAPI.userRegisterUsingPOST(userRegisterRequest: registerRequest) { response, error in
            isLoading = false
            
            if let error = error {
                errorMessage = "Registration failed: \(error.localizedDescription)"
                return
            }
            
            guard let response = response else {
                errorMessage = "Registration failed: No server response"
                return
            }
            
            if let code = response.code, code == 0 {
                // 注册成功
                isPresented = false
                onRegisterSuccess()
            } else {
                // 注册失败
                errorMessage = response.message ?? "Registration failed, please check your input"
            }
        }
    }
}

#Preview {
    LoginView()
} 