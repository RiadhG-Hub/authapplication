//
//  QuizListViewModel.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 12/8/2024.
//

import Foundation
import Combine
class QuizListViewModel : ObservableObject {
    let quizRepos : QuizRepository  = QuizRepository(remoteRepository: QuizRemoteRepository(),
                                                     cachedRepository: QuizCachedRepository(),
                                                     questionCount: 10)
    @Published var quizResult : Quiz?
    
    @Published var selectedCategory  : Category = QuizRepository.questionCategory.first!
    private var cancellables = Set<AnyCancellable>()
    
    init(quizResult: Quiz? = nil)   {
        self.quizResult = quizResult
        
       
        
    }
    
    
    @MainActor
    func fetchCachedQuiz(category : Category) async throws  {
        
       
       
        let result  = try?  await  quizRepos.fetchCachedQuiz(id: "")
       quizResult = result
        
    }
    
    @MainActor
    func initCategory(category  : Category) async throws  {
       
        Task{
            try await quizRepos.initCategories(category: category)
            
            
           
        }
        
    }
    
    
    
    
    
    
    
}
