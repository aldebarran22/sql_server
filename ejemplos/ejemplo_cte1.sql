declare @startDate datetime,  
        @endDate datetime;  
  
select  @startDate = getdate(),  
        @endDate = getdate()+16;  
-- select @sDate StartDate,@eDate EndDate  
;with myCTE as  
   (  
      select 1 as ROWNO,@startDate StartDate,'W - '+convert(varchar(2),  
            DATEPART( wk, @startDate))+' / D ('+convert(varchar(2),@startDate,106)+')' as 'WeekNumber'  
    )  
select ROWNO,Convert(varchar(10),StartDate,105)  as StartDate ,WeekNumber from myCTE ;