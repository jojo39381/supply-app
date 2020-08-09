//
//  RequestDetail.swift
//  supply
//
//  Created by Michael Zhu on 8/9/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//
import SwiftUI

struct RequestDetail: View {
    var request: Request
    @State var requesting = false
    @State var displayNum: String = "0"
    @State var tempNum: String = "0"
    @State var showingAlert = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                MapView(coordinate: request.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
                .cornerRadius(20)
                
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40)
                            .padding(20)
                        VStack {
                            HStack {
                                Text(request.name)
                                    .font(.title)
                                Spacer()
                            }
                            .padding(.bottom, CGFloat(0.0))
                            HStack(alignment: .bottom) {
                                Text("is requesting")
                                Text("\(request.quantity) " + request.item)
                                    .font(.headline)
                                Spacer()
                                
                            }
                            .padding(.top, 0)
                            .padding(.bottom, CGFloat(10.0))
                        }
                    }
                    .foregroundColor(.white)
                    HStack {
                        Text(request.city + ", " + request.state)
                            .font(.subheadline)
                            .padding(5)
                        .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(5)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tristique orci ac sem sodales, ut vehicula tellus auctor. Duis ac lobortis orci, sed iaculis diam. Integer id dapibus arcu, in pulvinar dui. ").padding(5)
                        .foregroundColor(.white)
                }
                CircleImage(image: request.image)
                    .padding()
                VStack {
                    HStack {
                        Button(action: {
                            self.requesting.toggle()
                        }) {
                            if self.requesting {
                                Image(systemName: "hand.raised.fill")
                                    .imageScale(.large)
                            } else {
                                Image(systemName: "hand.raised")
                                    .imageScale(.large)
                            }
                        }.padding()
                        .foregroundColor(.white)
                        Image(systemName: "captions.bubble")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .padding()
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    if self.requesting {
                        VStack {
                            Text("How many would you like to donate?")
                                .foregroundColor(.white)
                        
                            TextField("Input number:", text: $displayNum)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            .padding(3)
                                .border(Color.white)
                                .cornerRadius(10)
                             
                            Button(action: {
                                self.tempNum = self.displayNum
                                self.displayNum = "0"
                                self.showingAlert = true
                            }) {
                                Text("Submit!")
                                    .foregroundColor(.purple)
                            }
                            .frame(height: 50.0)
                            .frame(width: 100.0)
                            .background(Color.white)
                            
                        .cornerRadius(10)
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Request submitted!"), message: Text("Requested " + self.tempNum + " " + request.item), dismissButton: .default(Text("Got it!")))
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
            
            }
        }
        .background(Color.black)
    }
}


struct RequestDetail_Previews: PreviewProvider {
    static var previews: some View {
        RequestDetail(request: requestData[0])
    }
}
