//
//  AddTraining.swift
//  App727
//
//  Created by IGOR on 23/07/2024.
//

import SwiftUI

struct AddTraining: View {
    
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
                        
                        viewModel.trPhoto = viewModel.currTPhoto
                        
                        viewModel.addTraining()
                        
                        viewModel.trTitle = ""
                        viewModel.trDescr = ""
                        viewModel.currTPhoto = ""
                        
                        viewModel.fetchTrainings()
                        viewModel.fetchExercises()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 16, weight: .medium))
                    })
                    .opacity(viewModel.currTPhoto.isEmpty || viewModel.trTitle.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.currTPhoto.isEmpty || viewModel.trTitle.isEmpty ? true : false)
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.tphotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currTPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currTPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 70, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currTPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                                    .padding(1)
                            }
                            
                        })
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Title")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trTitle)
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
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.trDescr.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.trDescr)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                        Text("Exercises")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        
                        VStack(spacing: 10) {
                            
                            ForEach(viewModel.exercises.filter{($0.exTraining ?? "") == viewModel.trTitle}, id: \.self) { index in
                                
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
                            viewModel.exTraining = viewModel.trTitle
                            
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
    }
}

#Preview {
    AddTraining(viewModel: TrainingViewModel())
}
