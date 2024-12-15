//
//  ProductDetailsPageView.swift
//  E-commerceApp
//
//  Created by Kritchanat on 22/12/2567 BE.
//

import SwiftUI

struct ProductDetailsPageView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var cartManager: CartManager
    var product: Product

    var body: some View {
        ZStack {
            Color.white
            
            ScrollView  {
                
                    ZStack(alignment: .topTrailing) {
                        Image(product.image)
                            .resizable()
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 300)
                    }
                    
                DescriptionView(product: product)
                
            }
            .ignoresSafeArea(edges: .top)
           
            HStack {
                Text("฿\(product.price).00")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                Spacer()
                
                Button(action: {
                    cartManager.addToCart(product: product)
                }, label: {
                    Text("Add to Cart")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding()
                        .padding(.horizontal, 8)
                        .background(Color("Secondary"))
                        .cornerRadius(16.0)
                })
            }
            .padding()
            .padding(.horizontal)
            .background(Color("kPrimary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
       }
       .navigationBarBackButtonHidden(true)
       .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}))
    }
}

#Preview {
    ProductDetailsPageView(product: productList[3])
        .environmentObject(CartManager())
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 25, height: 25)
            .clipShape(Circle())
            .overlay(RoundedCorner(radius: 50).stroke())
            .foregroundColor(Color("kPrimary"))
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


struct DescriptionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(product.name)
                    .font(.title .bold())
                
                Spacer()
                
                Text("฿\(product.price).00")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .cornerRadius(12)
                    .foregroundColor(Color("Secondary"))
            }
            .padding(.vertical)
            
            HStack {
                HStack(spacing: 10) {
                    ForEach(0 ..< 5) { index in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                    }
                    Text("(4.9)")
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        cartManager.removeFromCart(product: product)
                    }, label: {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                    })
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorner(radius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("1")
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                    
                    Button(action: {
                        cartManager.addToCart(product: product)
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color("kPrimary"))
                            .clipShape(Circle())
                    })
                }
            }
            
            Text("Description")
                .font(.title3)
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text(product.description)
            Spacer()
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    
                    Text("Height: \(product.height)")
                        .foregroundColor(.gray)
                    Text("Width: \(product.width)")
                        .foregroundColor(.gray)
                    Text("Diameter: \(product.diameter)")
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Colors")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: Color.white)
                        ColorDotView(color: Color.black)
                        ColorDotView(color: Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1)))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
        }
        .padding(.vertical)
        .padding()
        .background(.white)
        .cornerRadius(26)
        .offset(y: -30)
        Spacer(minLength: 100)

    }
}

