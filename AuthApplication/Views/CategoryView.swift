import SwiftUI

struct CategoryView: View {
    
    @State var selectedCategory: Category = QuizRepository.questionCategory.first!
    @State private var navigateToDetail = false
    @ObservedObject private var quizListViewModel = QuizListViewModel()
    var questions: [Category] = []
   
    // Define the grid layout with fixed-size columns
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    fileprivate func cardItem(_ item: Category) -> some View {
        
        func cardBackgroundColor(categry: Category) -> Color {
            return selectedCategory == categry ? .blue.opacity(0.1) : .gray.opacity(0.1)
        }
        
        return Button(action: {
            selectedCategory = item
            quizListViewModel.selectedCategory = item
        }) {
            VStack {
                Image(item.imageLink)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(item.title)
            }
        }
        .frame(width: 100, height: 100)
        .background(cardBackgroundColor(categry: item))
        .foregroundColor(.black)
        .cornerRadius(10)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(questions, id: \.self) { item in
                            cardItem(item)
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                NavigationLink(destination: SectionsView(selectedCategory: $selectedCategory), isActive: $navigateToDetail) {
                    EmptyView()
                }
                
                Button(action: {
                    navigateToDetail = true
                }) {
                    Text("Next")
                        .padding(.all)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle(selectedCategory.title)
        }
    }
}

#Preview {
    CategoryView(questions: QuizRepository.questionCategory)
}
