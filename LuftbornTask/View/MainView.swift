//
//  ContentView.swift
//  LuftbornTask
//
//  Created by mohamed on 6/18/22.
//

import SwiftUI

struct MainView: View {
    //MARK: - Properties
    @StateObject private var observed = MainViewObserved() // link between the view and logical data
    @State var showMenu: Bool = false // button for menu action
    @State private var didTap1: Bool = false // Button for task 1
    @State private var didTap2: Bool = false // Button for task 2
    @State private var didTap3: Bool = false // Button for task 3
    @State private var didTap4: Bool = false // Button for task 4
    
    //MARK: - body
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ScrollView {
                    VStack(alignment: .center, spacing: 5) {
                        ForEach(observed.executer) { ex in
                            HStack {
                                Text(ex.createAt)
                                    .font(.body)
                                Text(ex.taskName)
                                    .fontWeight(.medium)
                                    .font(.title2)
                            } // HStack
                        } // ForEach
                    } // VStack
                } // ScrollView
                .frame(width: Constant.shared.width, height: Constant.shared.height)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                )
                Spacer()
                HStack(alignment: .center) {
                    Button {
                        self.resetActionButtons()
                        self.didTap1.toggle()
                        self.observed.getExecuter(taskName: "Task 1")
                    } label: {
                        Text("Task 1")
                            .padding()
                            .background(didTap1 ? Color.black : Color.clear).cornerRadius(5)
                            .foregroundColor(didTap1 ? Color.white : Color.black)
                    }
                    Button {
                        self.resetActionButtons()
                        self.didTap2.toggle()
                        self.observed.getExecuter(taskName: "Task 2")
                    } label: {
                        Text("Task 2")
                            .padding()
                            .background(didTap2 ? Color.black : Color.clear).cornerRadius(5)
                            .foregroundColor(didTap2 ? Color.white : Color.black)
                    }
                    Button {
                        self.resetActionButtons()
                        self.didTap3.toggle()
                        self.observed.getExecuter(taskName: "Task 3")
                    } label: {
                        Text("Task 3")
                            .padding()
                            .background(didTap3 ? Color.black : Color.clear).cornerRadius(5)
                            .foregroundColor(didTap3 ? Color.white : Color.black)
                    }
                    Button {
                        self.resetActionButtons()
                        self.didTap4.toggle()
                        self.observed.getExecuter(taskName: "Task 4")
                    } label: {
                        Text("Task 4")
                            .padding()
                            .background(didTap4 ? Color.black : Color.clear).cornerRadius(5)
                            .foregroundColor(didTap4 ? Color.white : Color.black)
                    }
                } // Hstack
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                )
            } // vstack
            .navigationBarTitle("Task Executer App", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
            ))
        } // NavigationView
    } // body
    
    //MARK: - Func
    private func resetActionButtons() {
        self.didTap1 = false
        self.didTap2 = false
        self.didTap3 = false
        self.didTap4 = false
    }
} // main view

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
