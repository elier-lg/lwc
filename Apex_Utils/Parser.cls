String jsonString = '{"subreddit": "aww", "author_fullname": "t2_43xhb", "title": "r/aww has a Discord server",    "top_awarded_type": null, "hide_score": false, "name": "t3_hyts0n", "quarantine": false, "link_flair_text_color": "dark", "upvote_ratio": 0.99, "author_flair_background_color": "", "subreddit_type": "public", "ups": 4199, "total_awards_received": 290}';
AwwPost post =  (AwwPost)JSON.deserialize(jsonString, AwwPost.Class);

system.debug(post.author_fullname);
