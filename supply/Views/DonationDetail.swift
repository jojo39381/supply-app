//
//  DonationDetail.swift
//  supply
//
//  Created by Michael Zhu on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import SwiftUI

struct DonationDetail: View {
    var donation: Donation
    @State var requesting = false
    @State var displayNum: String = "0"
    @State var tempNum: String = "0"
    @State var showingAlert = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                MapView(coordinate: donation.locationCoordinate)
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
                                Text(donation.name)
                                    .font(.title)
                                Spacer()
                            }
                            .padding(.bottom, CGFloat(0.0))
                            HStack(alignment: .bottom) {
                                Text("is donating")
                                Text("\(donation.quantity) " + donation.item)
                                    .font(.headline)
                                Spacer()
                                
                            }
                            .padding(.top, 0)
                            .padding(.bottom, CGFloat(10.0))
                        }
                    }
                    HStack {
                        Text(donation.city + ", " + donation.state)
                            .font(.subheadline)
                            .padding(5)
                        Spacer()
                    }
                    .padding(5)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tristique orci ac sem sodales, ut vehicula tellus auctor. Duis ac lobortis orci, sed iaculis diam. Integer id dapibus arcu, in pulvinar dui. ").padding(5)
                }
                CircleImage(image: donation.image)
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
                        Image(systemName: "captions.bubble")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                            .padding()
                        Image(systemName: "person")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    
                    if self.requesting {
                        VStack {
                            Text("How many would you like to request?")
                        
                            TextField("Input number:", text: $displayNum)
                                .multilineTextAlignment(.center)
                            .padding(3)
                                .border(Color.gray)
                                .cornerRadius(10)
                             
                            Button(action: {
                                self.tempNum = self.displayNum
                                self.displayNum = "0"
                                self.showingAlert = true
                            }) {
                                Text("Submit!")
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Request submitted!"), message: Text("Requested " + self.tempNum + " " + donation.item), dismissButton: .default(Text("Got it!")))
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
            
            }
        }
    }
}

struct DonationDetail_Previews: PreviewProvider {
    static var previews: some View {
        DonationDetail(donation: donationData[0])
    }
}
