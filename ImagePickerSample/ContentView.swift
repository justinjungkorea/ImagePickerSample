//
//  ContentView.swift
//  ImagePickerSample
//
//  Created by justin dongwook Jung on 2020/07/16.
//  Copyright © 2020 justin dongwook Jung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowingImagePicker = false
    var body: some View {
        
        VStack {
            Image(uiImage: UIImage())
                .frame(width: 200, height: 200)
                .border(Color.black, width: 1)
            
            Button(action: {
                self.isShowingImagePicker.toggle()
            }, label: {
                Text("Select Image")
                    .font(.system(size: 32))
            })
            .sheet(isPresented: $isShowingImagePicker, content: {
                ImagePickerView()
            })
        }
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
   
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectImage = info[.originalImage] as? UIImage {
                print(selectImage)
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}

struct DummyView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<DummyView>) -> UIButton {
        let button = UIButton()
        button.setTitle("Dummy", for: .normal)
        button.backgroundColor = .red
        return button
    }
    
    func updateUIView(_ uiView: DummyView.UIViewType, context: UIViewRepresentableContext<DummyView>) {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
