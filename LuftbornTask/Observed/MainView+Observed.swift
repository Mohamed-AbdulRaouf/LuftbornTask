//
//  MainView+Observed.swift
//  LuftbornTask
//
//  Created by mohamed on 6/18/22.
//

import SwiftUI

//MARK: - Protocol
protocol MainViewProtocol: AnyObject {
    var executer: [ExecuterData] { get set }
    func getExecuter(taskName: String)
}

extension MainView {
    
    class MainViewObserved: ObservableObject, MainViewProtocol {
        //MARK: - Properties
        @Published var executer = [ExecuterData]()
        
        //MARK: - Func
        func getExecuter(taskName: String) {
            DispatchQueue.main.async {
                self.executer.append(ExecuterData(createAt: Date().formatted(date: .numeric, time: .shortened), taskName: taskName))
            }
        }
    }
}
