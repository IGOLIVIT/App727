//
//  StatisticsView.swift
//  App727
//
//  Created by IGOR on 23/07/2024.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel = StatisticsViewModel()
    
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
                
                ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            
                            Text("Goals and achievements")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 150)
                            
                            NavigationLink(destination: {
                                
                                GoalView()
                                
                            }, label: {
                                
                                Text("Details")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(width: 140, height: 40)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color("prim")))
                            })
                        }
                        
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 160)
                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim2")))
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Your indicators")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("You can change them at any time")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 150)
                    }
                    
                    Spacer()
                    
                    Image("indic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 2))
                
                VStack(spacing: 14) {
                    
                    HStack {
                        
                        Text("Statistics")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isIndicators = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .medium))
                        })
                    }
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                    
                    HStack {
                        
                        VStack(spacing: 10) {
                            
                            Text("\(viewModel.YC)")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("Yellow cards")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.gray)
                            .frame(maxHeight: .infinity)
                            .frame(width: 1)
                        
                        VStack(spacing: 10) {
                            
                            Text("\(viewModel.RC)")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("Red cards")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.gray)
                            .frame(maxHeight: .infinity)
                            .frame(width: 1)
                        
                        VStack(spacing: 10) {
                            
                            Text("\(viewModel.FW)")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("Fouls won")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.gray)
                            .frame(maxHeight: .infinity)
                            .frame(width: 1)
                        
                        VStack(spacing: 10) {
                            
                            Text("\(viewModel.FC)")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                            
                            Text("Fouls conceded")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .fill(.gray)
                            .frame(maxHeight: .infinity)
                            .frame(width: 1)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 90)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 2))
                
                HStack {
                    
                    VStack(spacing: 8) {
                        
                        Text("Age")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.Age)")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 2))
                    .padding(2)
                    
                    VStack(spacing: 8) {
                        
                        Text("Height")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.Height)")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 2))
                    .padding(2)
                    
                    VStack(spacing: 8) {
                        
                        Text("Seasons")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(viewModel.Sessions)")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 2))
                    .padding(2)

                }
            }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isIndicators ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isIndicators = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isIndicators = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                        
                        Text("Your indicators")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                            .padding()
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Yellow cards")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.AddYC.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.AddYC)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Red cards")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.AddRC.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.AddRC)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Fouls won")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.AddFW.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.AddFW)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Fouls conceded")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.AddFC.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.AddFC)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Age")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.AddAge.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.AddAge)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Height")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.AddHeight.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.AddHeight)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            
                            Text("Sessions")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.AddSessions.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.AddSessions)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                            .padding(1)
                            
                        }
                        
                    }

                    HStack {
                        
                        Button(action: {
                            
                            viewModel.isIndicators = false
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Cancel")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(height: 50)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            }
                        })
                        
                        Button(action: {
                            
                            viewModel.YC = viewModel.AddYC
                            viewModel.RC = viewModel.AddRC
                            viewModel.FW = viewModel.AddFW
                            viewModel.FC = viewModel.AddFC
                            viewModel.Age = viewModel.AddAge
                            viewModel.Height = viewModel.AddHeight
                            viewModel.Sessions = viewModel.AddSessions
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isIndicators = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            
                        })
                        
                    }
                    .padding(.vertical)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isIndicators ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    StatisticsView()
}
