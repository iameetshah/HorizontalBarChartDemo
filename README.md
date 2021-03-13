# horizontalBarChartDemo

For Alignment created Custom Renderer :- CustomHorizontalXAxisRenderer


Default : Right Alignment

**For Left Aligment** :-

         let maxWidth:CGFloat = 96// Update as per your needs
         let actualSize = label.size(withAttributes: [.font: xAxis.labelFont]
         let newPositionX = pos - (maxWidth - actualSize.width)
   
  
**For Center Alignment** :-
label.padding(toLength: 16, withPad: " ", startingAt: 0)// Update from 16 as per your needs
    
    
   
   
