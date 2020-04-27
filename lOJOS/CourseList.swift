//
//  CourseView.swift
//  lOJOS
//
//  Created by RAAD BADR on 27/04/2020.
//  Copyright © 2020 RAAD BADR. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    @State var  courses = courseData
    @State var active = false
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(Double(self.activeView.height / 500))
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 30) {
                    Text("Shipments Types")
                        .font(.system(.largeTitle))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(
                                show: self.$courses[index].show,
                                course: self.courses[index],
                                active: self.$active,
                                index: index,
                                activeIndex: self.$activeIndex,
                                activeView: self.$activeView
                            )
                                
                                .offset(y: self.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                            
                            //                    .frame(height: self.courses[index].show ? screen.height : 280)
                            
                            .frame(height: 280)
                            .frame(maxWidth: self.courses[index].show ? .infinity : screen.width - 60)
                            .zIndex(self.courses[index].show ? 1 : 0)
                        
                        
                    }
                    
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
            .animation(.linear)
        }
    }
    
}
struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index : Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            VStack {
                Text("FOB, Free On Board, is a term in international commercial law specifying at what point respective obligations, costs, and risk involved in the delivery of goods shift from the seller to the buyer under the Incoterms standard published by the International Chamber of Commerce. FOB is only used in non-containerized sea freight or inland waterway transport. As with all Incoterms, FOB does not define the point at which ownership of the goods is transferred.The term FOB is also used in modern domestic shipping within the United States to describe the point at which a seller is no longer responsible for shipping cost.")
                
                Text("About This Shipment")
                    .font(.title).bold()
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            }
                
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
            .offset(y: show ? 460 : 0)
            .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)).opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        Text(course.subtitle)
                            .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)).opacity(0.7))
                    }
                    Spacer()
                    
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        }
                        .frame(width: 36, height: 36)
                        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                    
                    
                }
                
                Spacer()
                Image(uiImage: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
                
            }
                
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
                //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                .background(Color(course.color))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
                
            .gesture(
                show ?
                DragGesture().onChanged { value in
//                    if value.translation.height < 300 {
//
//                    self.activeView = value.translation
//                    }
                    guard value.translation.height < 300 else { return }
                    guard value.translation.height > 0 else { return }
                    
                    self.activeView = value.translation
                }
                .onEnded { value in
                    if self.activeView.height > 50 {
                        self.show = false
                        self.active = false
                        
                    }
                    self.activeView = .zero
                }
                :nil
            )
                .onTapGesture {
                    self.show.toggle()
                    self.active.toggle()
                    if self.show {
                        self.activeIndex = self.index
                        
                    }
                    else {
                        self.activeIndex = -1
                    }
            }
            
        }
            
        .frame(height: show ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 1000)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x: 0, y: 10.0, z: 0))
            //        .hueRotation(Angle(degrees: Double(self.activeView.height)))
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            .gesture(
                show ?
                    DragGesture().onChanged { value in
                        //                    if value.translation.height < 300 {
                        //
                        //                    self.activeView = value.translation
                        //                    }
                        guard value.translation.height < 300 else { return }
                        guard value.translation.height > 0 else { return }
                        
                        self.activeView = value.translation
                    }
                    .onEnded { value in
                        if self.activeView.height > 50 {
                            self.show = false
                            self.active = false
                            
                        }
                        self.activeView = .zero
                    }
                    :nil
        )
            
            .edgesIgnoringSafeArea(.all)
    }
}


struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: UIImage
    var logo: UIImage
    var color: UIColor
    var show: Bool
}


var courseData = [
    Course(title: "Shipment FOB", subtitle: "18 Ports", image: #imageLiteral(resourceName: "Background1"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
    Course(title: "Shipment DTD", subtitle: "120 Ports", image: #imageLiteral(resourceName: "Card3"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "Shipment Ex Work", subtitle: "50 Ports", image: #imageLiteral(resourceName: "Card4"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false)
]
