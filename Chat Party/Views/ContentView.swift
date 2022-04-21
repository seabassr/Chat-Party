//
//  ContentView.swift
//  Chat Party
//
//  Created by Sebastian Rodriguez on 3/24/22.
//

import SwiftUI

let contentBG = RadialGradient(gradient: Gradient(colors: [Color.mint, Color.indigo]),
                               center: .center, startRadius: 0, endRadius: 450)

struct ContentView: View {
    @EnvironmentObject var profile: Profile
    @ObservedObject var viewModel = Room()
    @State private var showChat: Bool = false
    @State private var showProfile: Bool = false
    @State private var showAlert: Bool = false
    @State private var serverEntry: String = ""
    @State private var groupID: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button("Edit", action: {
                            showProfile = true
                        })
                            .foregroundColor(.mint)
                    }
                    
                    ProfilePic()
                        .environmentObject(profile)
                    
                    Text(profile.items.username)
                        .font(.title)
                        .padding(.bottom)
                    
                    Text("Server ID:")
                        .font(.headline)
                    
                    TextField(" Server ID", text: $serverEntry)
                        .keyboardType(.numberPad)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(.thickMaterial)
                            .frame(height: 35)
                            .shadow(radius: 3))
                        .padding([.top, .bottom])
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: ChatView(chatroom: RoomItem(code: groupID),
                                                             profile: self.profile.items),
                                       isActive: .constant(showChat))
                        {
                            Text("Create")
                                .font(.headline)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(.blue)
                                    .frame(width: 100, height: 50)
                                    .shadow(radius: 3))
                        }
                        .simultaneousGesture(
                            TapGesture().onEnded{
                                createChat()
                            }
                        )
                        .onAppear{
                            showChat = false
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: ChatView(chatroom: RoomItem(code: groupID),
                                                             profile: self.profile.items),
                                       isActive: .constant(showChat))
                        {
                            Text("Join")
                                .font(.headline)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(.green)
                                    .frame(width: 100, height: 50)
                                    .shadow(radius: 3))
                        }
                        .simultaneousGesture(
                            TapGesture().onEnded{
                                joinChat()
                            }
                        )
                        .onAppear{
                            showChat = false
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                }
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            .sheet(isPresented: $showProfile, content: {
                ProfileView()
                    .environmentObject(profile)
            })
            .alert("The serverID doesn't exist", isPresented: $showAlert) {
                Button("Ok", action: {
                    showAlert = false
                })
            }
            .navigationBarHidden(true)
            .padding()
            .background(contentBG.ignoresSafeArea())
        }
    }
    
    func createChat() {
        groupID = Int.random(in: 100000..<999999)
        viewModel.createRoom(code: String(groupID), completion: {showChat = true},
                             failed: {showAlert = true})
        serverEntry = ""
    }
    
    func joinChat() {
        groupID = Int(serverEntry) ?? 0
        viewModel.joinRoom(code: serverEntry, completion: {showChat = true},
                           failed: {showAlert = true})
        serverEntry = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Profile())
    }
}
