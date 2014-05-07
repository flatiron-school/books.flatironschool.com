# Books.flatironschool.com

## Description

A database of books used in the Ruby classroom. Originally written by [den1k](https://github.com/den1k/booxr).

## Local Setup

1. `rake db:schema:load` locally to set up schema.
2. Comment out contents of `initializers/carrierwave.rb`
3. `rails generate figaro install`
4. Set AMAZON_KEY, AMAZON_SECRET, and AMAZON_BUCKET in `application.yml`
5. Comment in contents of `initializers/carrierwave.rb`

## Author

[Flatiron School](http://flatironschool.com/)

## License

My Spiffy App is MIT Licensed. See LICENSE for details.