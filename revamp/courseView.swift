import SwiftUI

struct courseView: View {
    @ObservedObject private var courseData: CourseData
    @State private var isAddingCourse = false
    @State private var newCourseCode = ""
    @State private var newCourseName = ""
    
    init(courseData: CourseData) {
        self.courseData = courseData
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach (courseData.courses, id: \.code) { course in
                        HStack {
                            Text(course.code).bold()
                            Text(course.name).padding(.horizontal)
                            }
                        }.onDelete(perform: removeCourse)
                    }
                
                Button("Add a course") {
                    isAddingCourse.toggle()
                }
                
                if isAddingCourse {
                    VStack {
                        HStack {
                            TextField("Code", text: $newCourseCode).padding()
                            TextField("Name", text: $newCourseName).padding()
                        }
                        Button("Submit") {
                            courseData.courses.append(Course(code: newCourseCode, name: newCourseName))
                            newCourseCode = ""
                            newCourseName = ""
                            isAddingCourse.toggle()
                        }
                    }
                }
            }.navigationTitle("Courses")
        }
        
    }

    func removeCourse(at offsets: IndexSet) {
        courseData.courses.remove(atOffsets: offsets)
    }
}

struct Course {
    let code: String
    let name: String
}

struct courseView_Previews: PreviewProvider {
    static var previews: some View {
        courseView(courseData: CourseData())
    }
}

class CourseData: ObservableObject {
    @Published var courses: [Course] = [Course(code: "CSC 121", name: "Intro to Computing")]
}
