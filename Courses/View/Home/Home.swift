//
//  Home.swift
//  Courses
//
//  Created by AbdelrahmanQasim on 1/28/22.
//

import SwiftUI

struct Home: View {
    @Namespace var animation
    @State var selectedCategory: String = "New"
    var categories = ["New", "Trendy", "Best-rated"]
    var body: some View {
        ZStack {
            //Menu(animation: animation)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack(spacing: 10) {
                        Button {
                            
                        } label: {
                            Image("menu")
                        }
                        
                        Text("Courses")
                            .scaledFont(name: .extraBold, size: 22)

                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("search")
                        }

                        Button {
                            
                        } label: {
                            Image("notification")
                        }

                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    ZStack {
                        Image("img3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12, antialiased: true)
                        
                        VStack(alignment: .leading) {
                            Text("LIVE")
                                .scaledFont(name: .bold, size: 10)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(Color(hex: .sunshade))
                                )
                            Spacer()
                            Text("The Photo Manipulation Live Workshop")
                                .scaledFont(name: .bold, size: 18)
                            Rectangle()
                                .frame(maxHeight: 1)
                                .foregroundColor(Color(hex: "F2F2F2"))
                                
                            HStack(spacing: 18) {
                                HStack {
                                    Image("see")
                                    Text("2459")
                                        .scaledFont(name: .medium, size: 12)
                                }
                                
                                HStack {
                                    Image("comment")
                                    Text("47")
                                        .scaledFont(name: .medium, size: 12)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                    .foregroundColor(.white)
                    .frame(maxHeight: 206)
                    .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(categories,id:\.self) { category in
                                CategoryItem(title: category, selectedTitle: $selectedCategory,animation: animation)
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                       
                    }
                    
                     .background(Color.white.cornerRadius(10))
                     .frame(maxWidth: .infinity)
                     .padding(.horizontal, 10)
                     .padding(.top)
                    
                    PostItem()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
                .background(
                    Color(hex: .mercury)
                        .edgesIgnoringSafeArea(.all)
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .leading)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CategoryItem: View {
    var title: String
    @Binding var selectedTitle: String
    var animation: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation {
                selectedTitle = title
            }
        } label: {
            Text(title)
            .scaledFont(name: .bold, size: 10)
            .padding(.vertical, 7)
            .padding(.horizontal, 23)
            .background(
                ZStack {
                    if selectedTitle == title {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color(hex: .sunshade))
                            .matchedGeometryEffect(id: "CategoryItem", in: animation)
                    }
                }
            )
            .foregroundColor(selectedTitle == title ? .white : Color(hex: "7E818D"))
            
        }
    }
}

struct PostItem: View {
    var post: Post
    var animation: Namespace.ID
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                
                Image(post.image)
                    .resizable()
                
                    .frame(width: 174, height: 210)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .matchedGeometryEffect(id: "image-\(post.id)", in: animation)
                HStack(spacing: 8) {
                    Image("favorate")
                    Text(post.favorateCount)
                        .scaledFont(name: .semiBold, size: 12)
                        .matchedGeometryEffect(id: "favorate-\(post.id)", in: animation)

                }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                    .padding()
            }
            .foregroundColor(.white)
            
            VStack(alignment: .leading,spacing: 5) {
                Text(post.title)
                    .scaledFont(name: .bold, size: 15)
                    .matchedGeometryEffect(id: "title-\(post.id)", in: animation)

                Text(post.category)
                    .scaledFont(name: .medium, size: 13)
                    .foregroundColor(Color(hex: "7E818D"))
                    .matchedGeometryEffect(id: "category-\(post.id)", in: animation)
            }
            
            
        }
        .frame(maxWidth: 174)
        .padding(.horizontal, 10)
        .padding(.top)
    }
}
