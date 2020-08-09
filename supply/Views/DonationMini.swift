//
//  DonationMini.swift
//  supply
//
//  Created by Michael Zhu on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import SwiftUI

struct DonationMini: View {
    var donation: Donation
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(donation.item).font(.title)
                    Text("\(donation.quantity)")
                        .font(.title)
                        .foregroundColor(.gray)
                    Spacer()
                }.padding(5)
                    .padding(.bottom, 0.0)
                HStack {
                    Text(donation.city + ", " + donation.state)
                        .font(.subheadline)
                    Spacer()
                }.padding(5)
                    .padding(.top, 0.0)
                HStack {
                    Image(systemName: "person.crop.circle")
                    .imageScale(.large)
                    .accessibility(label: Text("User Profile"))
                        .padding(5)
                    Text(donation.name)
                    Spacer()
                }
            }
            Text("35.7 mi")
                .padding(10)
                .background(Color.blue)
                .cornerRadius(10)
            
        }
    }
}


struct DonationMini_Previews: PreviewProvider {
    static var previews: some View {
        DonationMini(donation: donationData[0])
        .previewLayout(.fixed(width: 300, height: 120))
    }
}
