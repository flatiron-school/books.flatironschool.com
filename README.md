# Books.flatironschool.com

## Description

A database of books used in the Ruby classroom. Originally written by [den1k](https://github.com/den1k/booxr).

## Local Setup

1. `rake db:schema:load` locally to set up schema.
2. Comment out contents of `initializers/carrierwave.rb`.
3. `rails generate figaro install`.
4. Set AMAZON_KEY, AMAZON_SECRET, and AMAZON_BUCKET in `application.yml`.
5. Comment in contents of `initializers/carrierwave.rb`.

## TODO

1. Build out admin so that anyone a part of 'flatiron-school' github organization is given admin privileges when logging in via OAuth.
2. Ability for admin to add books
3. Currently loading PDF from Mozilla first, where our aws link is passed in as params, with page number as second param --> clean up / fix
4. Slugify book name for params (instead of having ID)
5. Support CHMs
6. Better UX for mobile

## Author

[Flatiron School](http://flatironschool.com/)

## License

My Spiffy App is MIT Licensed. See LICENSE for details.
