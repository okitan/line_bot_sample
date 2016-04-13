## What's this?

My sample implementation of LINE BOT Server

Note: 
* **There are no consideration of security.**

## Settings

### Variables to be set

| name | value |
|------|-------|
| LINE_CHANNEL_ID | your LINE Channel ID |
| LINE_CHANNEL_SECRET | your LINE Channel Secret |
| LINE_MID | your bot's MID |
| FIXIE_URL (optional) | When you use heroku, use FIXIE to make your IP static |

When you use heroku, this article is helpful: http://qiita.com/yuya_takeyama/items/0660a59d13e2cd0b2516

### Using IFTTT

See: https://github.com/okitan/line_bot_sample/blob/master/app/controllers/ifttt_callback_controller.rb
