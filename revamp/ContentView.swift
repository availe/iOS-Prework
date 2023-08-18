import SwiftUI

struct ContentView: View {
    @ObservedObject var courseData = CourseData()
    @ObservedObject var taskData = TaskData()
    @State var counter: Int = 0
    @State var backgroundColor: Color = Color.white
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                /*VStack {
                    viewControllerBridge()
                }.frame(height: 10)*/
                ScrollView {
                    scrollViewContent(courseData: courseData, taskData: taskData).padding(.bottom, 50)
                    Button("Change Color") {
                        counter += 1
                        if (counter > 2) {
                            counter = 0
                        }
                        switch counter {
                        case 0:
                            backgroundColor = Color.white
                        case 1:
                            backgroundColor = Color.pink
                        case 2:
                            backgroundColor = Color.yellow
                        default:
                            break
                        }
                    }.padding().background(.blue).foregroundColor(.white).font(.system(size: 22)).cornerRadius(5)
                }
                Spacer()
                
                HStack {
                    NavigationLink("Courses", destination: courseView(courseData: courseData)).frame(maxWidth: .infinity)
                    NavigationLink("Tasks", destination: taskView(taskData: taskData)).frame(maxWidth: .infinity)
                }
            }.navigationTitle("Study Planner").background(backgroundColor)
        }
    }
}

func scrollViewContent(courseData: CourseData, taskData: TaskData) -> some View {
    VStack {
            Text("Student Info").bold()
            studentInfo().padding(.vertical)
        Divider()
        Text("My Courses").bold()
        courseInfo(courseData: courseData).padding(.vertical)
        Divider()
        Text("My Tasks").bold()
        taskInfo(taskData: taskData).padding(.bottom)
    }.frame(maxWidth: .infinity)
}

func studentInfo() -> some View {
    VStack {
        HStack {
            Text("Student: ").bold()
            Text("Availe")
        }
        HStack {
            Text("College: ").bold()
            Text("Placeholder")
        }
        HStack {
            Text("Dream Job: ").bold()
            Text("AI Dev")
        }
    }
}

func courseInfo(courseData: CourseData) -> some View {
    VStack {
        ForEach(courseData.courses, id: \.code) { course in
            HStack {
                Text(course.code + " ").bold()
                Text(course.name)
            }
        }

    }
}

func taskInfo(taskData: TaskData) -> some View {
    VStack {
        ForEach(taskData.tasks, id: \.code) { task in
            VStack {
                HStack {
                    Text(task.title).bold()
                    Text(task.code).padding(.horizontal)
                }
                Text(task.desc)
            }.padding(.vertical)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
