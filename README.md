# iOS-Prework

Submitted by: **Availe**

**The original** strictly follows criteria. It's built using Storyboard has 3 labels and a button that when tapped changes screen to a random color.

**The revamp** utilizes SwiftUI and is a Study Planner. It has 3 views, a contentView, courseView, and taskView:
- The contentView is the main view and covers the original criteria of displaying student information. It also shows real time info on courseView and taskView, and includes a button that changes the background color when tapped.
- The courseView allows user to insert or delete courses. Changes are also reflected in contentView.
- The taskView allows user to insert or delete tasks. Changes are also reflected in contentView.

Please note that both courseView and taskView use course code as an identifier, such as in ```swiftForEach (courseData.courses, id: \.code)```. If say courseView has two courses with the same course course, it will show the first entry twice.

Time spent: **20** hours spent in total

## Required Features

The following **required** functionality is completed:

- [X] Users are see a screen with three labels and a button
- [X] Tapping the button changes the screen color to a random color
 
## Video Walkthrough

https://user-images.githubusercontent.com/94802525/261740033-3b4466f5-e0cc-491e-a2e1-6eaed20e3445.mp4

https://user-images.githubusercontent.com/94802525/261740914-aaaa4f61-bdae-496e-bc96-2c7303b33837.mov

## App Brainstorming (Step 4)

- YouTube: capable of streaming video content (lots of bandwidth) effectively
- Gmail: has lots of categories to help you organize and displays content quickly
- Earth: provides a view of the whole Earth with plenty of flexibility to explore

  I'd like to build an app that can scan a document and crop it from the picture. I feel that's already an ambitious task, but if possible the app would also be able to automatically categorize the document based on its content.

## Notes

Challenges faced while building the app include:
- Learning about @State and @ObservedObject (solved)
- Finding out correct approach/parameters to sync data to contentView (solved)
- Aligning content in contentView properly (not solved)
- Integrating StoryBoard into SwiftUI (not solved, used pure SwiftUI implementation instead)

## License

    Copyright 2023 Availe

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
