## to do

- create columns for `BillPost`: `total_votes`, `total_up_vote`, `total_down_vote`, `upvote_percentage`, `downvote_percentage`
- set cache for `total_votes`, `upvote_percentage`, `downvote_perncetage`. expires in 1 hour
- remove vote count in voting ui. just have a text in pink div that says voted, when they voted.
- destroy vote action. when an up_vote is already clicked and the user clicks up_vote again, then it should destroy the vote that was cached.
- create an efficient scraper that collects bills, then downloads pdf, then in one api call uploads pdf to open ai and asks it to provide an unbiased summary with 3-5 bullet points. then ask it to tag the bill based on 10 different tags. nationwide, local state, health, finance, income groups, education, science and technology, military and veteran, small businesses, and large coporations
- create table Tag, 