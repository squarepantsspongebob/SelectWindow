import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Window {
    id: mainWindow
    width: 400; height: 400;
    visible: true
    color: "#fce4ec"
    property var object
    property int col
    property int row
    Button{
        height: 40; width: 100;
        Rectangle{anchors.fill: parent; color: "#e91e63"}
        Text{
            anchors.centerIn: parent
            text:"Select"
            color: "#fce4ec"
            font.pixelSize: 20; font.bold: true
        }
        Component{
            id: component
            SelWin{
                anchors.centerIn: parent
            }
        }
        onClicked: {
            if (object == undefined){
                object = component.createObject(mainWindow)
                object.anchors.top = parent.bottom
                object.selNum.connect(theNum)
            }
            else{
                object.destroy()
            }
        }
    }
    function theNum(tColr, tRowr){
        col = parseInt(tColr)
        row = parseInt(tRowr)
        console.log((row+1)+" "+(col+1))
        object.destroy()
    }
}
