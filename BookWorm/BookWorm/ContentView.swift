//
//  ContentView.swift
//  BookWorm
//
//  Created by vishwasai.karnati on 27/08/23.
//

import SwiftUI

struct ContentView: View {
//    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title),
                                    SortDescriptor(\.author)]) var books: FetchedResults<Book>
    @State private var showingAddScreen = false
    var body: some View {
        NavigationView {
//           Text("Count: \(books.count)")
//               .navigationTitle("Bookworm")
            List {
                ForEach(books) { book in
                    NavigationLink {
//                        Text(book.title ?? "Unknown Title")
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }.foregroundColor( book.rating == 1 ? .red : .black  )
                        }
                    }
                }.onDelete(perform: deleteBooks)
            }
               .toolbar {
                   ToolbarItem(placement: .navigationBarTrailing) {
                       Button {
                           showingAddScreen.toggle()
                       } label: {
                           Label("Add Book", systemImage: "plus")
                       }
                   }
                   ToolbarItem(placement: .navigationBarLeading) {
                       EditButton()
                   }
               }
               .sheet(isPresented: $showingAddScreen) {
                   AddBookView()
               }
       }

    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let book = books[offset]

            // delete it from the context
            moc.delete(book)
        }

        // save the context
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
