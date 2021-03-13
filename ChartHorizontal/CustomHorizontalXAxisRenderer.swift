//
//  CustomHorizontalXAxisRenderer.swift
//  ChartHorizontal
//
//  Created by Meet Shah on 13/03/21.
//

import Foundation
import Charts


class CustomHorizontalXAxisRenderer: XAxisRendererHorizontalBarChart {
    internal static let FDEG2RAD = CGFloat(.pi / 180.0)
    override func drawLabels(context: CGContext, pos: CGFloat, anchor: CGPoint) {
        guard
            let xAxis = self.axis as? XAxis,
            let transformer = self.transformer
        else { return }
        
        let labelFont = xAxis.labelFont
        let labelTextColor = xAxis.labelTextColor
        let labelRotationAngleRadians = xAxis.labelRotationAngle * CustomHorizontalXAxisRenderer.FDEG2RAD
        
        let centeringEnabled = xAxis.isCenterAxisLabelsEnabled
        
        // pre allocate to save performance (dont allocate in loop)
        var position = CGPoint(x: 0.0, y: 0.0)
        
        for index in stride(from: 0, to: xAxis.entryCount, by: 1) {
            // only fill x values
            
            position.x = 0.0
            
            if centeringEnabled {
                position.y = CGFloat(xAxis.centeredEntries[index])
            }
            else {
                position.y = CGFloat(xAxis.entries[index])
            }
            
            transformer.pointValueToPixel(&position)
            
            if viewPortHandler.isInBoundsY(position.y) {
                if let label = xAxis.valueFormatter?.stringForValue(xAxis.entries[index], axis: xAxis) {
                    let maxWidth:CGFloat = 96// Update as per your needs
                    let actualSize = label.size(withAttributes: [.font: xAxis.labelFont])
                    let newPositionX = pos - (maxWidth - actualSize.width)
                    
                    drawLabel(
                        context: context,
                        formattedLabel: label,
                        x: newPositionX,
                        y: position.y,
                        attributes: [NSAttributedString.Key.font: labelFont, NSAttributedString.Key.foregroundColor: labelTextColor],
                        anchor: anchor,
                        angleRadians: labelRotationAngleRadians)
                }
            }
        }
    }
}
