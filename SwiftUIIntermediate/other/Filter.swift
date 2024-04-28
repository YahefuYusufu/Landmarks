//
//  Filter.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-28.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class UserModelViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        //sort,
        /*
//        filteredArray = dataArray.sorted { (user1, user2 ) -> Bool in
//            return user1.points > user2.points
//        }
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
        */
        //filter
        /*
//        filteredArray = dataArray.filter({ (user) -> Bool in
//            return user.isVerified
//        })
        filteredArray = dataArray.filter({ $0.isVerified })
         */
        //map
        /*
//        mappedArray = dataArray.map({(user) -> String in
//            return user.name ?? "ERROR"
//        })
//        mappedArray = dataArray.map({$0.name})
        
//        mappedArray = dataArray.compactMap({(user) -> String? in
//            return user.name
//        })
//        mappedArray = dataArray.compactMap({ $0.name})
        */
        
        mappedArray = dataArray
            .sorted(by: {$0.points > $1.points})
            .filter({$0.isVerified})
            .compactMap({$0.name})
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "prg", points: 12, isVerified: true)
        let user2 = UserModel(name: nil, points: 3, isVerified: false)
        let user3 = UserModel(name: "akrem", points: 4, isVerified: true)
        let user4 = UserModel(name: "dilxat", points: 61, isVerified: false)
        let user5 = UserModel(name: "rena", points: 21, isVerified: true)
        let user6 = UserModel(name: "guzel", points: 34, isVerified: false)
        let user7 = UserModel(name: nil, points: 53, isVerified: true)
        let user8 = UserModel(name: "abla", points: 45, isVerified: false)
        let user9 = UserModel(name: "max", points: 12, isVerified: true)
        let user10 = UserModel(name: nil, points: 66, isVerified: false)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
}

struct Filter: View {
    @StateObject var vm = UserModelViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) {name in
                Text(name)
                        .font(.title)
                }
//                ForEach(vm.filteredArray ) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name.uppercased())
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    Filter()
}
