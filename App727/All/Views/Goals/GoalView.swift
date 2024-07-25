//
//  GoalView.swift
//  App727
//
//  Created by IGOR on 23/07/2024.
//

import SwiftUI

struct GoalView: View {
    
    @StateObject var viewModel = GoalsViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("lbg")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
            
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .padding(.bottom, 30)
                
                if viewModel.goals.isEmpty {
                    
                    VStack {
                        
                        Text("There are no records")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                        
                        Image("ball")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90)
                        
                    }
                    .padding(40)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 2))
                    .padding(2)
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.goals, id: \.self) { index in
                            
                                VStack(spacing: 8) {
                                    
                                    Text(index.goalTitle ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text(index.goalDescr ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .multilineTextAlignment(.center)
                                        .padding(.bottom)
                                    
                                    Text(index.goalAch ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Rectangle()
                                        .fill(Color("prim"))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 1)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 2))
                                .padding(2)
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGoals()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddGoal(viewModel: viewModel)
        })
    }
}

#Preview {
    GoalView()
}
