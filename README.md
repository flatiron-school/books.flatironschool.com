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

1. Currently loading PDF from Mozilla first, where our aws link is passed in as params, with page number as second param --> clean up / fix
2. Slugify book name for params (instead of having ID)
3. Support CHMs
4. Better UX for mobile
5. Flesh out downloading count to then have licensing countdown

## Author

[Flatiron School](http://flatironschool.com/)

## License

My Spiffy App is MIT Licensed. See LICENSE for details.
