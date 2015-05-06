
import QtQuick 2.0
import QtQuick.Controls 1.0


Item {
    id: item
    anchors.fill: parent;

    property int currentIndex: -1
    property bool launchStatus:false


    Label{
        id: to
        y: 40


        text: "To:"
        font.pixelSize: 22
        font.italic: true
        color: "steelblue"

    }
    TextField {
        id:totext
        width: 250
        height: 30
        x: to.x +250
        y: to.y
        font.pointSize: 15
        placeholderText: "eg: abc@abc.com"
    }


    Label{
        id: sub
        y: to.y + 50


        text: "Subject:"
        font.pixelSize: 22
        font.italic: true
        color: "steelblue"

    }
    TextField {
        id:subtext
        width: 250
        height: 30
        x: sub.x +250
        y: sub.y
        font.pointSize: 15
        placeholderText: "eg: Hii"
    }


    Label{
        id: body
        y: sub.y + 50


        text: "Body:"
        font.pixelSize: 22
        font.italic: true
        color: "steelblue"

    }
    TextArea {
        id: bodytext
        width: 250
        x: body.x +250
        y: body.y
        text: ""
    }

    Label{
        id: attach
        y: body.y + 175


        text: "Attachment:"
        font.pixelSize: 22
        font.italic: true
        color: "steelblue"


    }
    TextField {
        id: attachtext
        width: 250
        x: body.x +250
        y: body.y +175
        text: ":res/Qt_1.jpg"
        enabled: false
    }


    GroupBox {
        id: grpbox
        y: attachtext.y + 50
        width: 350

        title: "Select Type Of Sending Email Method"
        Row {

            RadioButton {
                id: radioButton2a
                text: "Using Mailto"
                checked: true
                onClicked:{
                    currentIndex =-1
                    currentIndex = 0
                }
            }
            RadioButton {
                id: radioButton2b
                text: "Using EML file\n (This supports attachment on Dekstop)"
                onClicked:{
                    currentIndex =-1
                    currentIndex = 1
                }
            }

        }
    }

    Button {
        id:open
        text: "Open Default Mail Client"
        height: 30

        y: grpbox.y +75
        onClicked: {

            launchStatus =  mainwindow.launchClient(totext.text,subtext.text,bodytext.text,radioButton2a.checked);
            onlaunch()

        }
    }
    Label{
        id: statustext
        y: open.y + 40
        text: ""
        font.pixelSize: 22
        font.italic: true
        color: "green"


    }
    onCurrentIndexChanged:  {

        radioButton2a.checked = currentIndex == 0

        radioButton2b.checked = currentIndex == 1

    }

    function onlaunch()
    {
        if(launchStatus){
            statustext.color = "green"
            statustext.text = "Status : Succesfully open default mail client"
        }
        else{
            statustext.color = "red"
            statustext.text =  "Status : Fail to open default mail client"
        }
    }

}
