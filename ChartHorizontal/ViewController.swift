//
//  ViewController.swift
//  ChartHorizontal
//
//  Created by Meet Shah on 13/03/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    let unitsSold = [0.1, 0.7, 0.9, 11.1, 11.6, 13.5, 20.3, 41.2]
    let unitsSold2 = [0.5, 2.0, 2.1, 2.3, 15.1, 15.5, 18.4, 44.1]
    let singleLineCategory1 = ["Small Category1", "Medium Category 11", "Medium Category 12", "Medium Category 13", "Small Category2", "Medium Category 14", "Medium Category 15", "Very very Big Category 1"]
    let singleLineCategory2 = ["Medium Category 01", "Medium Category 02", "Small Category1", "Very very Big Category 1", "Small Category2", "Small Category3", "Medium Category 03", "Small Category4"]
    
    @IBOutlet var hBarChartView: HorizontalBarChartView!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        segmentControl.addTarget(self, action: #selector(segmentedControlDidChange(_:)), for: .valueChanged)
        setupChart()
    }
    
    func setupChart() {
        setupGraphSettings()
        setDataForSegmentFirst()
    }
    
    @objc func segmentedControlDidChange(_ sender:UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            setDataForSegmentFirst()
        default:
            setDataForSegmentSecond()
        }
    }
    func setupGraphSettings() {
        hBarChartView.extraLeftOffset = 30.0
        hBarChartView.extraTopOffset = 0.0
        hBarChartView.extraBottomOffset = 0.0
        hBarChartView.extraRightOffset = 30.0


        hBarChartView.pinchZoomEnabled = false
        hBarChartView.doubleTapToZoomEnabled = false
        hBarChartView.scaleXEnabled = false
        hBarChartView.scaleYEnabled = false

        // Graph Config
        hBarChartView.legend.enabled = false
        let xAxis = hBarChartView.xAxis
        xAxis.enabled = true
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false
        xAxis.drawLabelsEnabled = true

        xAxis.axisMinimum = 0
        xAxis.axisMaximum = 8
        xAxis.granularityEnabled = true
        xAxis.granularity = 1

        let leftAxis = hBarChartView.leftAxis
        leftAxis.enabled = true
        leftAxis.drawLabelsEnabled = false
        leftAxis.axisMinimum = 0

        hBarChartView.rightAxis.enabled = false

        // Graph Color & Font settings
        hBarChartView.backgroundColor = .white
        leftAxis.zeroLineColor = UIColor.clear
        leftAxis.axisLineColor = UIColor.clear
        leftAxis.gridColor = UIColor.black.withAlphaComponent(0.2)
        xAxis.labelFont = UIFont.systemFont(ofSize: 14)
        xAxis.labelTextColor = UIColor.black.withAlphaComponent(0.5)


        /* Renderer */
        hBarChartView.xAxisRenderer = CustomHorizontalXAxisRenderer(
            viewPortHandler:hBarChartView.viewPortHandler,
            xAxis: xAxis,
            transformer:hBarChartView.getTransformer(forAxis: .left),
            chart: hBarChartView)


    }
    func dataSetWith(entries: [BarChartDataEntry],
                     colors: [UIColor] = [.black],
                     highlightColor: UIColor,
                     label: String = "") -> BarChartDataSet {

        let barDataSet = BarChartDataSet(entries: entries, label: label)
        barDataSet.valueFont = UIFont.systemFont(ofSize: 14)
        barDataSet.drawValuesEnabled = true
        barDataSet.colors = colors
        barDataSet.highlightColor = highlightColor

        return barDataSet
    }

    func setDataForSegmentFirst() {
        hBarChartView.data = nil
        let truncatedCategory = singleLineCategory1.map { $0.truncate(18) }
        hBarChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: truncatedCategory)


        var arrEntries = [BarChartDataEntry]()

        for interval in 0..<unitsSold.count {
            arrEntries.append(BarChartDataEntry(x: Double(interval), y: Double(unitsSold[interval])))
        }



        let arrarDataSet = dataSetWith(entries: arrEntries,
                                            colors: [UIColor.cyan],
                                             highlightColor: UIColor.black,
                                             label: "label1")

        let barData = BarChartData(dataSet: arrarDataSet)
        setupPercentValueFormatter(barData: barData)
        barData.barWidth = 0.2
        hBarChartView.data = barData

        hBarChartView.data?.notifyDataChanged()
    }
    func setDataForSegmentSecond() {
        hBarChartView.data = nil
        let truncatedCategory = singleLineCategory2.map { $0.truncate(18) }
        hBarChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: truncatedCategory)

        var arrEntries = [BarChartDataEntry]()

        for interval in 0..<unitsSold2.count {
            arrEntries.append(BarChartDataEntry(x: Double(interval), y: Double(unitsSold2[interval])))
        }

        let arrarDataSet = dataSetWith(entries: arrEntries,
                                            colors: [UIColor.blue],
                                             highlightColor: UIColor.black,
                                             label: "label2")

        let barData = BarChartData(dataSet: arrarDataSet)
        setupPercentValueFormatter(barData: barData)
        barData.barWidth = 0.2
        hBarChartView.data = barData

        hBarChartView.data?.notifyDataChanged()
    }

    func setupPercentValueFormatter(barData : BarChartData) {
        let percentAxisFormatter = NumberFormatter()
        percentAxisFormatter.numberStyle = .decimal
        percentAxisFormatter.positiveSuffix  = "%"
        percentAxisFormatter.maximumFractionDigits = 2
        barData.setValueFormatter(DefaultValueFormatter(formatter: percentAxisFormatter))

        barData.setValueFont(UIFont.systemFont(ofSize: 12))
        barData.setValueTextColor(UIColor.black.withAlphaComponent(0.6))
    }
}

