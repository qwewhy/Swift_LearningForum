// ViewModels/BrowseQuestionsViewModel.swift
import SwiftUI
import Combine

class BrowseQuestionsViewModel: ObservableObject {
    @Published var questions: [QuestionVO] = []
    @Published var isLoading = false
    @Published var hasMoreData = false
    private var currentPage = 1
    private var pageSize = 10
    
    private var allQuestions: [QuestionVO] = []
    private var filteredQuestions: [QuestionVO] = []
    
    init() {
        // Initialize with empty arrays
        allQuestions = []
        filteredQuestions = []
    }
    
    func loadQuestions() {
        isLoading = true
        
        // Load questions from file
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let loadedQuestions = JSONFileManager.shared.loadQuestions()
            
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.allQuestions = loadedQuestions
                self.filteredQuestions = loadedQuestions
                self.updateQuestions(page: 1)
                self.isLoading = false
            }
        }
        
        // Real API call (commented out)
        /*
        currentPage = 1
        
        let request = QuestionQueryRequest()
        request.current = currentPage
        request.pageSize = pageSize
        request.sortField = "createTime"
        request.sortOrder = "descend"
        
        QuestionControllerAPI.listQuestionVOByPageUsingPOST(questionQueryRequest: request) { [weak self] response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    print("Error loading questions: \(error)")
                    return
                }
                
                guard let data = response?.data, let records = data.records else {
                    self?.questions = []
                    return
                }
                
                self?.questions = records
                self?.hasMoreData = (data.current ?? 0) < (data.pages ?? 0)
            }
        }
        */
    }
    
    func loadMoreQuestions() {
        guard hasMoreData, !isLoading else { return }
        
        isLoading = true
        currentPage += 1
        
        // Update from local storage with pagination
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.updateQuestions(page: self.currentPage)
            self.isLoading = false
        }
        
        // Real API call (commented out)
        /*
        let request = QuestionQueryRequest()
        request.current = currentPage
        request.pageSize = pageSize
        request.sortField = "createTime"
        request.sortOrder = "descend"
        
        QuestionControllerAPI.listQuestionVOByPageUsingPOST(questionQueryRequest: request) { [weak self] response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    print("Error loading more questions: \(error)")
                    return
                }
                
                guard let data = response?.data, let records = data.records else { return }
                
                self?.questions.append(contentsOf: records)
                self?.hasMoreData = (data.current ?? 0) < (data.pages ?? 0)
            }
        }
        */
    }
    
    func searchQuestions(_ searchText: String) {
        guard !searchText.isEmpty else {
            filteredQuestions = allQuestions
            updateQuestions(page: 1)
            return
        }
        
        isLoading = true
        currentPage = 1
        
        // Filter questions locally
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
            let lowercasedSearch = searchText.lowercased()
            let filtered = self.allQuestions.filter { question in
                return (question.title ?? "").lowercased().contains(lowercasedSearch) ||
                       (question.content ?? "").lowercased().contains(lowercasedSearch) ||
                       (question.answer ?? "").lowercased().contains(lowercasedSearch)
            }
            
            DispatchQueue.main.async {
                self.filteredQuestions = filtered
                self.updateQuestions(page: 1)
                self.isLoading = false
            }
        }
        
        // Real API call (commented out)
        /*
        let request = QuestionQueryRequest()
        request.current = currentPage
        request.pageSize = pageSize
        request.searchText = searchText
        
        QuestionControllerAPI.searchQuestionVOByPageUsingPOST(questionQueryRequest: request) { [weak self] response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    print("Error searching questions: \(error)")
                    return
                }
                
                guard let data = response?.data, let records = data.records else {
                    self?.questions = []
                    return
                }
                
                self?.questions = records
                self?.hasMoreData = (data.current ?? 0) < (data.pages ?? 0)
            }
        }
        */
    }
    
    func addQuestion(_ question: QuestionVO) {
        // Add question to file storage
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let success = JSONFileManager.shared.addQuestion(question)
            
            if success {
                DispatchQueue.main.async {
                    guard let self = self else { return }
                    // Reload all questions to include the new one
                    self.loadQuestions()
                }
            }
        }
    }
    
    private func updateQuestions(page: Int) {
        // Calculate pagination
        let startIndex = (page - 1) * pageSize
        let endIndex = min(startIndex + pageSize, filteredQuestions.count)
        
        // Check if there are valid indices
        if startIndex < filteredQuestions.count {
            let pagedQuestions = Array(filteredQuestions[startIndex..<endIndex])
            
            if page == 1 {
                questions = pagedQuestions
            } else {
                questions.append(contentsOf: pagedQuestions)
            }
            
            // Determine if there are more pages
            hasMoreData = endIndex < filteredQuestions.count
        } else {
            if page == 1 {
                questions = []
            }
            hasMoreData = false
        }
    }
}
