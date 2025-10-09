#  Data Dictionary — Notflix Analytics

This document describes the key tables and fields used in the **Notflix Analytics** project.  
The dataset is a simulated Netflix-style platform with catalogue, consumption, and ratings data.

---

## 1. Catalogue Data (`catalogue_data`)
**Rows:** 1,363  
**Description:** Metadata about each movie/show available on Notflix.  


## 1. Catalogue Data (`catalogue_data`)
**Rows:** 1,363  
**Description:** Metadata about each movie/show available on Notflix.

| Column Name                 | Type         | Description                                                              |
|----------------------------|--------------|--------------------------------------------------------------------------|
| content_id                 | String (PK)  | Unique identifier for each title                                         |
| accesslevel                | String       | Whether the title is free or paid                                        |
| contentformat              | String       | Format type (e.g., mp4)                                                  |
| contenttype                | String       | Type of content (e.g., video)                                            |
| date_added                 | Date         | Date the title was added                                                 |
| imagedetails_heroimage     | String (URL) | URL/path to large “hero” artwork (banner usage)                          |
| imagedetails_thumbnailimage| String (URL) | URL/path to small thumbnail used in grids                                |
| imagedetails_todayimage    | String (URL) | URL/path to “today”/featured artwork variant                             |
| status                     | String       | Content status (e.g., LIVE)                                              |
| type                       | String       | Media type (e.g., Movie, TV Show)                                        |
| title                      | String       | Title name                                                               |
| director                   | String       | Director(s)                                                              |
| cast                       | String       | Main actors                                                              |
| country                    | String       | Country of production                                                    |
| release_year               | Integer      | Year of release                                                          |
| rating                     | String       | Maturity rating (e.g., TV-MA, PG-13)                                     |
| duration                   | String       | Length (e.g., "120 min", "2 Seasons")                                    |
| listed_in                  | String       | Genre(s), comma-separated                                                |
| description                | Text         | Synopsis                                                                 |

> Notes: Image fields may be `NULL`; formats are typically PNG/JPG URLs or storage paths.

---

## 2. Consumption Data (`consumption_data`)
**Rows:** 901,877  
**Description:** User activity logs showing how content was consumed.  

| Column Name     | Type        | Description                                               |
|-----------------|------------|-----------------------------------------------------------|
| usersessionid   | String (PK) | Unique session identifier                                 |
| userid          | String      | Unique user identifier                                    |
| content_id      | String (FK) | ID of the content being consumed (links to `catalogue_data`) |
| user_duration   | Float       | Actual time (in minutes) the user watched                 |
| content_duration| Float       | Total duration (in minutes) of the content                |
| platform        | String      | Platform used (e.g., Android, iOS, Web)                   |
| consumption_date| Date        | Date of the consumption session                           |

---

## 3. Ratings Data (`rating_data`)
**Rows:** 712,714  
**Description:** Feedback data from users on content.  

| Column Name     | Type        | Description                                               |
|-----------------|------------|-----------------------------------------------------------|
| feedback_id     | String (PK) | Unique feedback identifier                                |
| usersessionid   | String (FK) | Session linked to this feedback                           |
| userid          | String      | Unique user identifier                                    |
| rating          | String      | User’s rating (AWESOME, GOOD, DISMISSED, BAD, TERRIBLE)   |
| review_date     | Date        | Date of review submission                                 |
| review_time     | Time        | Time of review submission                                 |

---

##  Notes
- **Grain:**  
  - `catalogue_data` → one row per title  
  - `consumption_data` → one row per user-session-content interaction  
  - `rating_data` → one row per rating event  

- **Joins:**  
  - `catalogue_data.content_id = consumption_data.content_id`  
  - `consumption_data.usersessionid = rating_data.usersessionid`  

---

##  Usage in Analysis
- **Completion rate** = `SUM(user_duration) / SUM(content_duration)` grouped by content_id.  
- **Views** = distinct `usersessionid` per content_id.  
- **Ratings** = mapped text → numeric (5 to 1).  
- **Filters**: Only `status = 'LIVE'` content considered.  

