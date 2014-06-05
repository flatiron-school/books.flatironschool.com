# Books.flatironschool.com

## Description

A database of books used in the Ruby classroom. Originally written by [den1k](https://github.com/den1k/booxr) and [georgemayer](https://github.com/georgemayer/). To specify a page number for a PDF, simply add it to the end of the URL, like so: [http://books.flatironschool.com/books/77?page=24](http://books.flatironschool.com/books/77?page=24).

## Website Links
* Original Site: [books.flatironschool](http://books.flatironschool.com/)
* Master Branch: [library.flatironschool](http://library.flatironschool.com/)
* Beta Branch:   [beta-library.flatironschool](http://beta-library.herokuapp.com/)

## Local Setup

* Set AMAZON_KEY, AMAZON_SECRET, AMAZON_BUCKET, GITHUB_KEY, and GITHUB_SECRET in `config/application.yml`:
```
AMAZON_KEY: NUMBERSANDLETTERS
AMAZON_SECRET: NUMBERSANDLETTERSANDSYMBOLS
AMAZON_BUCKET: BUCKETNAMEHERE
GITHUB_KEY: NUMBERSANDLETTERS
GITHUB_SECRET: NUMBERSANDLETTERS
```
* Run `rake db:migrate`.
* Run `rake db:seed` to add the organization flatiron-school-students to the organizations table.
* Run local server with `rails s` and go to `http://localhost:3000/` in your browser before logging in via GitHub.
* Set `User.last.update(:admin => true)` in the `rails console` to become an admin.

## TODO

1. Currently loading PDF from Mozilla first, where our aws link is passed in as params, with page number as second param --> clean up / fix
2. ~~Slugify book name for params (instead of having ID)~~
3. Support CHMs
4. Better UX for mobile
5. Flesh out downloading count to then have licensing countdown
6. ~~Add way to make cover photo of PDFs~~
7. Add way to manually upload cover photo
8. ~~Add tags~~

## Author

[Flatiron School](http://flatironschool.com/)

## License

My Spiffy App is MIT Licensed. See LICENSE for details.

## Resources
* [PDF.js](http://www.askapache.com/javascript/pdf-js.html)-[Page Number Docs](http://www.askapache.com/javascript/pdf-js.html#Options_after_the-s0)
