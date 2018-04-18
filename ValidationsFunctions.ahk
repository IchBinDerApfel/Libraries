

ExcelInit() {
	oWorkbook:= ComobjActive("Excel.Application")
	oWorkbook.Application.DisplayAlerts := False
}

Button(color) {
	oWorkbook.Application.DisplayAlerts := FALSE
	;~ Try
	;~ {
		switch = 1

		Loop, 5
			Try
		If (oWorkbook.ActiveSheet.ListObjects[A_INDEX].Active) = (-1)	; Attempt to find the table
			Table:= oWorkbook.ActiveSheet.ListObjects[A_INDEX].Name		; Declare table

		Check:= oWorkbook.Range(table).Rows(1).Row						; Find the row

		i :=  oWorkbook.Selection.Rows.Count						; Loop the selected range
		Loop, %i%
		{
			rw:= oWorkbook.Selection.Cells(A_INDEX).Row	; Find the current row

			rw:= (RW - Check) + 1

			if (RW > 0)
			{
				if !(oWorkbook.Selection.Cells(A_Index).EntireRow.hidden) then
				{
					try
					oWorkbook.Range(table).Rows(rw).Font.ColorIndex:= color
				}
			}	
			rw+=1
			
			if (switch = "1")
			{
				Guicontrol, Timer:, Time, +1
				t+=1
				if (t = "100")
					switch = 0
			} 
			
			if (switch = "0") 
			{
				t-=1
				Guicontrol, Timer:, Time, -1
				if (t = "0")
					switch = 1
			}
			GuiControl, Timer:, Scan, Records Colored: %A_index%
		}
	;~ }
	oWorkbook.Application.DisplayAlerts := TRUE	; re-enable alerts
return
}

SubGroupCount(SG1, SG2, SG3, SG4, SG5, SG6) {
	/*
		This function covers the counting of subgroups entered into the gui. this allows us to understand how many times to loop the actions listed in the Validations quickpad for closing these groups.
	*/
	if !(SG1 = "")
		SGLength.push(SG1)
	if !(SG2 = "")
		SGLength.push(SG2)
	if !(SG3 = "")
		SGLength.push(SG3)
	if !(SG4 = "")
		SGLength.push(SG4)
	if !(SG5 = "")
		SGLength.push(SG5)
	if !(SG6 = "")
		SGLength.push(SG6)
		return
	}