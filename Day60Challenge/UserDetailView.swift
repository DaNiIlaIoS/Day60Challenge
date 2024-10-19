//
//  UserDetailView.swift
//  Day60Challenge
//
//  Created by Даниил Сивожелезов on 19.10.2024.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 150))
                        .foregroundStyle(.secondary)
                    VStack {
                        HStack {
                            TitleText(text: user.name)
                            Spacer()
                            Text(user.isActive ? "🟢 Online" : "🔴 Offline")
                                .fontWeight(.bold)
                        }
                        
                        HStack {
                            Text("Company: \(user.company)")
                            Spacer()
                            Text("Age: \(user.age)")
                        }
                        .font(.headline)
                    }
                }
                CustomDivider()
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "envelope")
                        Link(user.email, destination: URL(string: (user.email))!)
                    }
                    
                    HStack {
                        Image(systemName: "house")
                        Text(user.address)
                    }
                }
                CustomDivider()
                
                VStack(alignment: .leading) {
                    TitleText(text: "About Me")
                    Text(user.about)
                }
                CustomDivider()
                
                VStack(alignment: .leading) {
                    TitleText(text: "Tags")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(user.tags, id: \.self) { tag in
                                Text(tag.capitalized)
                                    .font(.headline)
                                Rectangle()
                                    .frame(width: 2, height: 20)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                CustomDivider()
                
                VStack(alignment: .leading) {
                    TitleText(text: "Friends")
                    VStack(spacing: 10) {
                        ForEach(user.friends, id: \.id) { friend in
                            HStack {
                                Image(systemName: "person.circle.fill")
                                Text(friend.name)
                                Spacer()
                                Text(Bool.random() ? "🟢  Online" : "🔴 Offline")
                            }
                            .fontWeight(.bold)
                        }
                    }
                }
                
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TitleText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title.bold())
            .padding(.bottom, 5)
    }
}

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.gray)
    }
}

//#Preview {
//    UserDetailView(user: User(
//        id: "50a48fa3-2c0f-4397-ac50-64da464f9954",
//        isActive: false,
//        name: "Alford Rodriguez",
//        age: 21,
//        company: "Imkan",
//        email: "alfordrodriguez@imkan.com",
//        address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
//        about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt",
//        registered: "2015-11-10T01:47:18-00:00",
//        tags: [
//            "cillum",
//            "consequat",
//            "deserunt",
//            "nostrud",
//            "eiusmod",
//            "minim",
//            "tempor"
//        ],
//        friends: [
//            Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0",
//                   name: "Hawkins Patel"),
//            Friend(id: "0c395a95-57e2-4d53-b4f6-9b9e46a32cf6",
//                   name: "Jewel Sexton"),
//            Friend(id: "be5918a3-8dc2-4f77-947c-7d02f69a58fe",
//                   name: "Berger Robertson"),
//            Friend(id: "6ba32d1b-38d7-4b0f-ba33-1275345eacc0",
//                   name: "Bonita White"),
//            Friend(id: "5890bacd-f49c-4ea2-b8fa-02db0e083238",
//                   name: "Karin Collins"),
//        ]))
//}
