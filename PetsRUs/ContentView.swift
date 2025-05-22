//
//  ContentView.swift
//  PetsRUs
//
//  Created by Cathal Farrell on 21/05/2025.
//

import SwiftUI
import Petstore
import Todo
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            print("🔥 Fetching pets...\n\n")
            await loadPets()
            print("🔥 Fetching todos...\n\n")
            await loadTodos()
        }
    }
    
    func loadPets() async {
        do {
            let client = Petstore.Client(
                serverURL: URL(string: "https://www.rte.ie")!,
                transport: URLSessionTransport()
            )
            let input = Operations.findPetsByStatus.Input(query: .init(status: Operations.findPetsByStatus.Input.Query.statusPayload()))
            let response = try await client.findPetsByStatus(input)
            print("✅ Response: \(response)")
        } catch {
            print("🔴 Failed to load pets: \(error)")
        }
    }
    
    func loadTodos() async {
            do {
                let client = Todo.Client(
                    serverURL: URL(string: "https://www.rte.ie")!, // Replace with actual Todo server
                    transport: URLSessionTransport()
                )
                let todos = try await client.getTodos()
                print("✅ Fetched Todos: \(todos)")
            } catch {
                print("🔴 Failed to load todos: \(error)")
            }
        }
}

#Preview {
    ContentView()
}
