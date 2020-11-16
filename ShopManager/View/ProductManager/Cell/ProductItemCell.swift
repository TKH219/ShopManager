//
//  ProductItemCell.swift
//  ShopManager
//
//  Created by Trần Khánh Hà on 11/13/20.
//

import SwiftUI

struct ProductItemCell: View {
    
    @ObservedObject var productItemModel: ProductItemModel
    @State private var totalHeight = CGFloat.zero
    init(model: ProductItemModel) {
        self.productItemModel = model
    }

    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            HStack(content: {
                Text(self.productItemModel.productName ?? "").lineLimit(4).multilineTextAlignment(TextAlignment.leading)
            }).multilineTextAlignment(TextAlignment.leading)

            changeCountView
        }
    }
    
    var changeCountView: some View {
        VStack(alignment: HorizontalAlignment.trailing) {
            HStack(spacing: 10.0) {
                Button(action: {
                    self.productItemModel.count += 1
                }, label: {
                    HStack(spacing: 10.0){
                        Image(systemName: "plus")
                    }
                }).buttonStyle(PlainButtonStyle())
                Spacer()
                TextField("\(String.init(self.productItemModel.count ?? 0))", text: Binding(get: {
                    String.init(self.productItemModel.count)
                }, set: { (text) in
                    self.productItemModel.setCount(count: text)
                })).keyboardType(.phonePad)
                .frame(width: 60, height: nil)
                .padding(.all, 5)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    self.productItemModel.count -= 1
                }, label: {
                    HStack(spacing: 10.0){
                        Image(systemName: "minus")
                    }
                }).buttonStyle(PlainButtonStyle())
            }.padding(EdgeInsets(top: 10.0, leading: 0.0, bottom: 10.0, trailing: 16.0))
        }
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
            var width = CGFloat.zero
            var height = CGFloat.zero

            return
//                self.item(text: String.init(self.productItemModel.count))
                self.changeCountView
                        .padding([.horizontal, .vertical], 4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width)
                            {
                                width = 0
                                height -= d.height
                            }
                            let result = width
//                            if tag == self.tags.last! {
//                                width = 0 //last item
//                            } else {
                                width -= d.width
//                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
//                            if tag == self.tags.last! {
//                                height = 0 // last item
//                            }
                            return result
                        }).background(viewHeightReader($totalHeight))
        }

        private func item(text: String) -> some View {
            Text(text)
                .padding(.all, 5)
                .font(.body)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(5)
        }

        private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
            return GeometryReader { geometry -> Color in
                let rect = geometry.frame(in: .local)
                DispatchQueue.main.async {
                    binding.wrappedValue = rect.size.height
                }
                return .clear
            }
        }
}
