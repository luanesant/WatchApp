//
//  ModalHome.swift
//  Harmon WatchKit Extension
//
//  Created by Radija Praia on 15/03/21.
//

import SwiftUI

struct ModalHome: View {
    var body: some View {

        ScrollView(.vertical){
            Text(Translations.Titles.modalHome)
                .padding(.top, 12)
                .padding(.bottom, 12)
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .accessibility(label: Text(Translations.VoiceOver.modalOver))
        }
    }
}

struct ModalHome_Previews: PreviewProvider {
    static var previews: some View {
        ModalHome()
    }
}
