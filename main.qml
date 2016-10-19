import QtQuick 2.7

 Rectangle {
     width: 500
     height: 500



     // Create a flickable to view a large image.
     Flickable {
         id: view
         anchors.fill: parent
         contentWidth: picture.width
         contentHeight: picture.height

         Image {
             id: picture
             source: "1.jpg"
             asynchronous: true
         }

         // Only show the scrollbars when the view is moving.
         states: State {
             name: "ShowBars"
             when: view.movingVertically || view.movingHorizontally
             PropertyChanges { target: verticalScrollBar; opacity: 1 }
             PropertyChanges { target: horizontalScrollBar; opacity: 1 }
         }

         transitions: Transition {
             NumberAnimation { properties: "opacity"; duration: 100 }
         }
     }

     // Attach scrollbars to the right and bottom edges of the view.
     ScrollBar {
         id: verticalScrollBar
         width: 12; height: view.height-12
         anchors.right: view.right
         opacity: 0
         orientation: Qt.Vertical
         position: view.visibleArea.yPosition
         pageSize: view.visibleArea.heightRatio
     }

     ScrollBar {
         id: horizontalScrollBar
         width: view.width-12; height: 12
         anchors.bottom: view.bottom
         opacity: 0
         orientation: Qt.Horizontal
         position: view.visibleArea.xPosition
         pageSize: view.visibleArea.widthRatio
     }
 }
