/*
 * Copyright (c) 2013-2014 Meltytech, LLC
 * Author: Dan Dennedy <dan@dennedy.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import Shotcut.Controls 1.0

Rectangle {
    width: 400
    height: 200
    color: 'transparent'
    property string gainParameter: 'gain'
    Component.onCompleted: {
        if (filter.isNew) {
            // Set default parameter values
            filter.set(gainParameter, 1.0)
            slider.value = filter.getDouble(gainParameter) * 100
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8

        RowLayout {
            Label { text: qsTr('Gain') }
            SliderSpinner {
                id: slider
                minimumValue: 0
                maximumValue: 300
                suffix: ' %'
                decimals: 1
                spinnerWidth: 80
                value: filter.getDouble(gainParameter) * 100
                onValueChanged:filter.set(gainParameter, value / 100)
            }
            UndoButton {
                onClicked: slider.value = 100
            }
        }
        Item {
            Layout.fillHeight: true;
        }
    }
}
