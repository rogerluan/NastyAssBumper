# SerialBumper Barebone

No seriously, this is super barebone example of post bumping on facebook using rufus-scheduler and koala gems.

## Instruction

I assume you know how to use terminal and unix stuff etc, hackers.

1. Get a [heroku](http://heroku.com) account. Install the toolbelt and learn how to use it.
2. Create an application on [facebook developers](https://developer.facebook.com). Then go to [graph explorer](https://developers.facebook.com/tools/explorer/), select the app you just created, then click on **Get Access Token**.
3. Under *User Data Permissions*, tick **user_groups**. Then under *Extended Permissions*, tick **publish_actions**. We are going to need the permissions to post a comment to your target group post, then delete it to bump the post.
4. Once you authorized your app to do such actions, copy down the access token generated.
5. Find your group post ID. If your group post permalink is `https://www.facebook.com/groups/groupname/permalink/736699879685753`, then your post ID should be the last part of URL, bunch of numbers.
6. Now we gonna create a heroku app for that. Before that please initiate git repository.
	# Replace xxxbumperxxx with any name you want
	$ git init
	$ heroku create xxxbumperxxx
7. Once you have created the app, we set the environment variables.
	$ heroku config:set POST_ID=736699879685753 ACCESS_TOKEN=fewjfjwfjewfhjcbvhh324732u32832d2h23h892982389289h92dhu32uiehu
8. Push the app up
	$ git add .
	$ git commit -m 'Let the bumping begin!'
	$ git push -u heroku master
	# Building bla bla bla
9. If the deployment is successful, we start the bump dyno.
	$ heroku ps:scale bump=1

Use this at your own risk.