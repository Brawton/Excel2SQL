create proc Upload_ExcelToSQLViaDLL  (
	@tbl as typExcelToSQLViaDLL READONLY
)


as

	

	/*************************************************************************/
	/*** DELETE ***/

	delete from ExcelToSQLViaDLL with (TABLOCKX) where RaceId not in (Select RaceId from @tbl)


	/*************************************************************************/
	/*** INSERT ***/

	Insert into ExcelToSQLViaDLL with (TABLOCKX) Select * from @tbl where RaceId not in (Select RaceId from ExcelToSQLViaDLL)



	/*************************************************************************/
	/*** Update ***/

	update ExcelToSQLViaDLL
	set
		ExcelToSQLViaDLL.RaceDate = t.RaceDate
	,	ExcelToSQLViaDLL.Country = t.Country
	,	ExcelToSQLViaDLL.CourseName = t.CourseName
	,	ExcelToSQLViaDLL.CourseId = t.CourseId
	,	ExcelToSQLViaDLL.Going = t.Going
	,	ExcelToSQLViaDLL.Weather = t.Weather
	,	ExcelToSQLViaDLL.Stalls = t.Stalls
	,	ExcelToSQLViaDLL.Downloaded = t.Downloaded
	from
		@tbl t
	where
		ExcelToSQLViaDLL.RaceId = t.RaceId 
	and (
		isnull(ExcelToSQLViaDLL.RaceDate, '01 Jan 1900') = isnull(t.RaceDate, '01 Jan 1900')
	or	isnull(ExcelToSQLViaDLL.Country, '') = isnull(t.Country, '')
	or	isnull(ExcelToSQLViaDLL.CourseName, '') = isnull(t.CourseName, '')
	or	isnull(ExcelToSQLViaDLL.CourseId, 0) = isnull(t.CourseId, 0)
	or	isnull(ExcelToSQLViaDLL.Going, '') = isnull(t.Going, '')
	or	isnull(ExcelToSQLViaDLL.Weather, '') = isnull(t.Weather, '')
	or	isnull(ExcelToSQLViaDLL.Stalls, '') = isnull(t.Stalls, '')
	or	isnull(ExcelToSQLViaDLL.Downloaded, '') = isnull(t.Downloaded, '')
	)



/*




*/