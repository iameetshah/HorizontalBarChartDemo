# horizontalBarChartDemo

Chart Library Used :- https://github.com/danielgindi/Charts
**Actual Result**
<img width="280" alt="horizontalBarChart" src="https://iameetshah.github.io/assets/Actual_result_Segment1.png">
<img width="280" alt="horizontalBarChart" src="https://iameetshah.github.io/assets/Actual_result_Segment2.png">

**Expected Result**
<img width="280" alt="horizontalBarChart" src="https://iameetshah.github.io/assets/Expected_result_Segment1.png">
<img width="280" alt="horizontalBarChart" src="https://iameetshah.github.io/assets/Expected_result_Segment2.png">

**Default** : Right Alignment

**For Left Aligment** :-

         let maxWidth:CGFloat = 96// Update as per your needs
         let actualSize = label.size(withAttributes: [.font: xAxis.labelFont]
         let newPositionX = pos - (maxWidth - actualSize.width)
   
  
**For Center Alignment** :-
label.padding(toLength: 16, withPad: " ", startingAt: 0)// Update from 16 as per your needs

Link:-https://iameetshah.github.io/jekyll/2021/11/29/horizontalChart.html
    
    
   
   
