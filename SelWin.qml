import QtQuick 2.0

Rectangle {
    id: rect
    height: 320; width: 320
    color: "#fce4ec"
    property int num: 6
    property int tCol: 0
    property int tRow: 0
    signal selNum(int tColr, int tRowr)

    Grid{
        id: rectGrid
        anchors.fill: parent
        columns: num; rows: num
        Repeater{
            id:rectRep
            model: num*num
            anchors.fill: parent
            Rectangle{
                id: littleRect
                height: rect.height/num; width: rect.width/num
                color: "#f06292"
                border.width: 1
                border.color: "#f8bbd0"
                radius: 5
                opacity: focus?1:0.5
                MouseArea{
                    id: rectArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        littleRect.focus = 1
                        tRow=parseInt(index/num)
                        tCol=parseInt(index%num)
                        drawRect()
                    }
                    onClicked: {
                        selNum(tCol, tRow)
                    }
                }
            }
        }
    }

    function drawRect(){
        var i
        var indexr
        for(i=0;i<=num-1;i++)
        {
            for(var j=0; j<=num-1; j++)
            {
                indexr=i*num+j
                if ((i>tRow) || (j>tCol))
                    rectRep.itemAt(indexr).opacity=0.5
                else{
                    rectRep.itemAt(indexr).opacity=1
                }
            }
        }
    }
}


