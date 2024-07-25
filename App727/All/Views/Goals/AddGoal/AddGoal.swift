//
//  AddGoal.swift
//  App727
//
//  Created by IGOR on 23/07/2024.
//

import SwiftUI

struct AddGoal: View {
    
    @StateObject var viewModel: GoalsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.addGoal()
                        
                        viewModel.goalTitle = ""
                        viewModel.goalDescr = ""
                        viewModel.goalAch = ""
                        
                        viewModel.fetchGoals()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 16, weight: .medium))
                    })
                    .opacity(viewModel.goalTitle.isEmpty || viewModel.goalDescr.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.goalTitle.isEmpty || viewModel.goalDescr.isEmpty ? true : false)
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 17) {

                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Title")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.goalTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.goalTitle)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Description")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.goalDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.goalDescr)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Achievement")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.goalAch.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.goalAch)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddGoal(viewModel: GoalsViewModel())
}
