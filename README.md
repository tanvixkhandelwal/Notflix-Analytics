# Notflix-Analytics
End-to-end analytics case study on a Netflix-like platform. Built SQL models for completion, views, and ratings, and designed a Power BI dashboard with KPIs, engagement heatmaps, genre trends, and actionable insights to identify which titles to promote, monitor, or relegate.

The project uses SQL to model user behavior (completion rates, views, ratings) and builds a Power BI dashboard for executives to decide which titles to promote, monitor, or relegate.

Project at a glance
-**Tables:** `catalogue_data` (1,363 rows, 19 cols), `consumption_data` (901,877 rows), `rating_data` (712,714 rows)
-**Total Titles:** 1,342
-**Total Hours Watched:** 68.30m
-**Avg Completion Rate:** 77.86%
-**Avg Rating:** 3.87 / 5
 
Data & Schema
**catalogue_data:** `content_id`, `date_added`, `status`, `title`, `country`, `release_year`, `rating`, `duration`, `listed_in`, ... 
**consumption_data:** `usersessionid`, `userid`, `content_id`, `user_duration`, `content_duration`, `platform`, `consumption_date`  
**rating_data:** `feedback_id`, `usersessionid`, `userid`, `rating` (AWESOME…TERRIBLE), `review_date`, `review_time`

**Goal:** Identify which movies/genres to **promote, monitor, or relegate** based on completion rates, views, and ratings.

 Tools & Skills
- **SQL Server** — data modeling, joins, views, KPI calculations  
- **Power BI** — data cleaning, DAX measures, interactive dashboards  
- **Data Analysis** — trend analysis, user engagement, content strategy insights

  Key Analysis
- **Completion Rates**: Calculated by comparing watch duration vs. content duration  
- **Views**: Distinct session counts per title  
- **Ratings**: Converted textual ratings (“Awesome” → 5 … “Terrible” → 1) into numeric values  
- **Engagement Trends**: Heatmaps by genre, platform, day & time  
- **Content Strategy**: Action framework recommending promotion or relegation of titles

  Dashboard pages
1. **Title** — branding 
2. **Executive Summary** — KPI cards, top titles, genre treemap, trend lines  
3. **Catalogue Insights** — release year, maturity rating, monthly adds, geo map, top table  
4. **Consumption & Engagement** — completion by genre, platform usage, time heatmaps  
5. **Ratings & Feedback** — distributions, trends, top/lowest rated, review volumes  
6. **Actionable Insights / Content Strategy** — popularity vs. rating scatter, action table, funnel, regional strategy

*(Screenshots of the dashboard are in the `images/` folder.)*

 Key Features
-**Comprehensive KPI Tracking:**
Visual summaries of total titles, completion rates, and audience ratings with drill-downs by genre, platform, and region.
-**Actionable Strategy Framework:**
Data-driven “Promote / Monitor / Relegate” recommendations for each title based on its engagement and rating performance.
-**Engagement Analytics:**
Time-based heatmaps and funnels showing viewing patterns, completion behavior, and drop-off points.
-**Genre & Platform Insights:**
Identification of top-performing genres and dominant platforms (Android > Web > iOS).
-**Regional Viewership Mapping:**
Geographic visualization of where the most active users are concentrated worldwide.

 Project Rating & Summary
-This project analyzes a Netflix-like platform’s content performance using real-world analytical methods and provides clear, actionable insights on content performance, audience engagement, and regional behavior.  With data from over 1,300 titles and 2M+ feedback records, it highlights viewer patterns, identifies underperforming titles, and supports executive-level decision-making.
 --By combining SQL-based data modeling and Power BI visual storytelling, the dashboard helps business teams quickly identify which titles to promote, monitor, or relegate based on measurable engagement and satisfaction metrics.
The analysis connects user behavior (views, completion, ratings) with content strategy decisions, offering a holistic view of what drives platform success and retention.







