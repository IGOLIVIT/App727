//
//  TrainDetail.swift
//  App727
//
//  Created by IGOR on 23/07/2024.
//

import SwiftUI

struct TrainDetail: View {

    @StateObject var viewModel: TrainingViewModel
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
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 16, weight: .medium))
                    })

                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {

                        Image(viewModel.selectedTraining?.trPhoto ?? "")
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                                    .padding(1)
                        .padding(.bottom)
                        
                        Text(viewModel.selectedTraining?.trTitle ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 26, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedTraining?.trDescr ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Exercises")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
                        VStack(spacing: 10) {
                            
                            ForEach(viewModel.exercises.filter{($0.exTraining ?? "") == (viewModel.selectedTraining?.trTitle ?? "")}, id: \.self) { index in
                                
                                HStack {
                                    
                                    Image(index.exPhoto ?? "")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .padding(1)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(index.exName ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(3)
                                        
                                        Text(index.exType ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            .padding(3)
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.ePhotos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.curEPhoto = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.curEPhoto.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 30, weight: .regular))
                                        .frame(width: 100, height: 100)
                                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.curEPhoto)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .padding(1)
                                }
                                
                            })
                            
                            VStack {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Title")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.exName.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.exName)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                .padding(1)
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Type")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.exType.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.exType)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                .padding(1)
                            }
                        }
                        
                        Button(action: {
                            
                            viewModel.exPhoto = viewModel.curEPhoto
                            viewModel.exTraining = viewModel.selectedTraining?.trTitle ?? ""
                            
                            viewModel.addExercise()
                            
                            viewModel.exName = ""
                            viewModel.exType = ""
                            viewModel.curEPhoto = ""
                            
                            viewModel.fetchExercises()
                            
                        }, label: {
                            
                            Text("+ Add an exercise")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .padding(.vertical)
                        .disabled(viewModel.exName.isEmpty || viewModel.trTitle.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchExercises()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteTraining(withTrTitle: viewModel.selectedTraining?.trTitle ?? "", completion: {
                            
                            viewModel.fetchTrainings()
                        })

                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    TrainDetail(viewModel: TrainingViewModel())
}
