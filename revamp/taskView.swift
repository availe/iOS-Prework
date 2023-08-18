import SwiftUI

struct taskView: View {
    @ObservedObject private var taskData: TaskData
    @State private var isAddingTask = false
    @State private var newTaskTitle = ""
    @State private var newTaskCode = ""
    @State private var newTaskDesc = ""
    
    init(taskData: TaskData) {
        self.taskData = taskData
    }
    
    var body: some View {
        NavigationView {
            VStack {
                    List {
                        ForEach (taskData.tasks, id: \.title) { task in
                            VStack {
                                HStack {
                                    Text(task.title).bold()
                                    Text(task.code).padding(.horizontal)
                                }
                                Text(task.desc)
                            }.padding(.vertical)
                        }.onDelete(perform: removeTask)
                    }
                Button("Add a task") {
                    isAddingTask.toggle()
                }
                
                if isAddingTask {
                    VStack {
                        HStack {
                            TextField("Title", text: $newTaskTitle).padding()
                            TextField("Code", text: $newTaskCode).padding()
                        }
                        TextField("Desc", text: $newTaskDesc).padding()
                        Button("Submit") {
                            taskData.tasks.append(Task(title: newTaskTitle, code: newTaskCode, desc: newTaskDesc))
                            newTaskTitle = ""
                            newTaskCode = ""
                            newTaskDesc = ""
                            isAddingTask.toggle()
                        }
                    }
                }
            }.navigationTitle("Tasks")
        }
    }
    
    func removeTask(at offsets: IndexSet) {
        taskData.tasks.remove(atOffsets: offsets)
    }
}

struct Task {
    let title: String
    let code: String
    let desc: String
}

class TaskData: ObservableObject {
    @Published var tasks: [Task] = [Task(title: "Finish HW", code: "CSC 126", desc: "Finish for loops hw")]
}

struct taskView_Previews: PreviewProvider {
    static var previews: some View {
        taskView(taskData: TaskData())
    }
}
