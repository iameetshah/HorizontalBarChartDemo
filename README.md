# horizontalBarChartDemo

Chart Library :- https://github.com/danielgindi/Charts

<img width="363" alt="horizontalBarChart" src="https://user-images.githubusercontent.com/6469823/111032382-e5499200-8431-11eb-9f34-04d590edc91a.png">



For Alignment created Custom Renderer :- CustomHorizontalXAxisRenderer


Default : Right Alignment

**For Left Aligment** :-

         let maxWidth:CGFloat = 96// Update as per your needs
         let actualSize = label.size(withAttributes: [.font: xAxis.labelFont]
         let newPositionX = pos - (maxWidth - actualSize.width)
   
  
**For Center Alignment** :-
label.padding(toLength: 16, withPad: " ", startingAt: 0)// Update from 16 as per your needs
    
    
   
   
