
# horizontalBarChartDemo

https://user-images.githubusercontent.com/6469823/111030120-a9f59600-8426-11eb-8cab-863495cb92ea.mov



For Alignment created Custom Renderer :- CustomHorizontalXAxisRenderer


Default : Right Alignment

**For Left Aligment** :-

         let maxWidth:CGFloat = 96// Update as per your needs
         let actualSize = label.size(withAttributes: [.font: xAxis.labelFont]
         let newPositionX = pos - (maxWidth - actualSize.width)
   
  
**For Center Alignment** :-
label.padding(toLength: 16, withPad: " ", startingAt: 0)// Update from 16 as per your needs
    
    
   
   
