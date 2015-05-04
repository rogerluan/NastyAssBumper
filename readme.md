# Nasty Ass Bumper

A simple script to bump your post in group that you are not administrating and make it look like it's pinned.

## Setting Up

1. Create an application on [facebook developers](https://developer.facebook.com/).
2. When you are done, take note of the application ID and application secret, you will need them later.
3. Go to [Graph Explorer](https://developers.facebook.com/tools/explorer/), click on the app you have just created, click on **Get Access Token**.
4. Under *User Data Permissions*, tick **user_groups**. Then under *Extended Permissions*, tick **publish_actions**. We are going to need the permissions to post a comment to your target group post, then delete it to bump the post.
5. Once you authorized your app to do such actions, copy down the access token generated.
6. And then [extend your access token lifetime](#extending-access-token-lifetime). This will be the access token you put in Heroku.
7. Find your group post ID. If your group post permalink is `https://www.facebook.com/groups/12341344/permalink/736699879685753`, then your post ID should be the last part which is **736699879685753**.
8. Click this magical button: [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/anonoz/NastyAssBumper)
9. Fill in the form and click **Create App**
10. Click on **Manage App**
11. Click on the **Edit** at the top right corner, and slide the number of `bump` dynos to 1.
12. Hit save

## Stopping it

1. Go to [heroku](http://www.heroku.com), log into your account, go into your app's dashboard.
2. Click **Edit** on top right corner, slide the number of `bump` dynos to 0, save.

## Updating it

1. Go to [heroku](http://www.heroku.com), log into your account, go into your app's dashboard.
2. Inside **settings** of your app, inside the **Config Variables**, edit the `POST_ID` to the new post ID you want to bump.

# Issues

## If guide is not clear enough or confuse you

[Create a new issue](https://github.com/anonoz/NastyAssBumper/issues/new) and lemme know where can I explain better.

## Extending Access Token Lifetime

Your access token actually expires quite soon, no fret, we just need to extend it.

Now before you set the short lived access token into heroku config (or if you did, never mind). We are going to use it to exchange for a long lived one, I guess it probably lasts around 60 days.

Type the following URL into browser, replace the variables (CAPITALIZED ONES):

```
https://graph.facebook.com/oauth/access_token?client_id=APP_ID&client_secret=APP_SECRET&grant_type=fb_exchange_token&fb_exchange_token=THE_TOKEN_YOU_GOT_FROM_GRAPH_EXPLORER_JUST_NOW
```

Once you got the new access token, copy it down. We will use them later.

Reference: [https://developers.facebook.com/docs/facebook-login/access-tokens/](https://developers.facebook.com/docs/facebook-login/access-tokens/)
