//
//  TrainingView.swift
//  App727
//
//  Created by IGOR on 23/07/2024.
//

import SwiftUI

struct TrainingView: View {
    
    @StateObject var viewModel = TrainingViewModel()
    
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
                
                Text("Training and exercises")
                    .foregroundColor(.black)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                Text("Make your own workouts and keep track of the indicators. You can change the information at any time.")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .regular))
                    .padding(.bottom)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("+ Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                .padding(.bottom)
                
                Text("Training")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                if viewModel.trainings.isEmpty {
                    
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
                        
                        ForEach(viewModel.trainings, id: \.self) { index in
                            
                            LazyVStack {
                                
                                Button(action: {
                                    
                                    viewModel.selectedTraining = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index.trPhoto ?? "")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(index.trTitle ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                                .padding(3)
                                            
                                            Text(index.trDescr ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14, weight: .regular))
                                                .padding(3)
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 18, weight: .medium))
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 2))
                                    .padding(2)
                                })
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchTrainings()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTraining(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            TrainDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    TrainingView()
}
