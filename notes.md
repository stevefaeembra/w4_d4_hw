**Problem areas**

- remembering to enable accessors after adding new fields, catches me every time
- keep forgetting .new(), that's the Python habit
- typos
- lots of problems with needing to continually restart Sinatra, i thought the models autoloaded.
- had problems with things clashing with ruby keywords, e.g. @typename was problematic
- problems with PG not liking SMALLINT
- problems with one query where there were both single and double quotes in the string. Couldn't find a way to do this so worked around it.
- problems returning straight numeric values in SQL queries, had to cast to INT4 e.g. 1::INT4

**Planning**

- found doing a day and a half of UX planning really helped me know what I was working towards.
- did things from back to front, one layer at a time, rather than doing each table separately through all layers in turn
- worked in order of similarity, e.g. once I did table A, I did the most similar other tables B and C. Meant I could copy code from other classes while it's still fresh.
- I used SQL to seed the tables. This meant I could be more productive from the start
