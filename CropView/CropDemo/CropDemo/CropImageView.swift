//
//  CropImageView.swift
//  iOSAsyncTest2
//
//  Created by tongbin的mac on 2023/8/27.
//

import SwiftUI

struct CropImageView: View {
    
    
    @State private var showPicker: Bool = false
    @State private var croppedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let croppedImage {
                    Image(uiImage: croppedImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height:400)
                    
                } else {
                    Text("No image is selected")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
            }
            .navigationTitle("Crop Image Picker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showPicker.toggle()
                    } label: {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.callout)
                    }
                    .tint(.red)
                    
                }
            }
            .cropImagePicker(options: [.circle,.square,.rectangle,.custom(.init(width: 200, height: 200))],
                             show: $showPicker,
                             croppedImage: $croppedImage)
        }
    }
}

struct CropImageView_Previews: PreviewProvider {
    static var previews: some View {
        CropImageView()
    }
}
