# Books.flatironschool.com

## Description

A database of books used in the Ruby classroom. Originally written by [den1k](https://github.com/den1k/booxr) and [georgemayer](https://github.com/georgemayer/). To specify a page number for a PDF, simply add it to the end of the URL, like so: [http://beta-library.herokuapp.com/books/agile-web-development-with-rails-4#page=55](http://beta-library.herokuapp.com/books/agile-web-development-with-rails-4#page=55).

## Application Environments and Heroku Apps

| Environment | Heroku App     | Domain                               | Github Repo                                                | Branch |
|-------------|----------------|--------------------------------------|------------------------------------------------------------|--------|
| Production  | flatiron-books | http://books.flatironschool.com      | http://github.com/flatiron-school/books.flatironschool.com | master |
| Beta        | beta-library   | http://beta.books.flatironschool.com | http://github.com/flatiron-school/books.flatironschool.com | functional   |
|             |                |                                      |                                                            |        |

## Local Setup
* In the terminal, run `brew install imagemagick`.
* In the terminal, run `brew install ghostscript`.
* Set AMAZON_KEY, AMAZON_SECRET, AMAZON_BUCKET, GITHUB_KEY, and GITHUB_SECRET in `config/application.yml`:
```
AMAZON_KEY: NUMBERSANDLETTERS
AMAZON_SECRET: NUMBERSANDLETTERSANDSYMBOLS
AMAZON_BUCKET: BUCKETNAMEHERE
GITHUB_KEY: NUMBERSANDLETTERS
GITHUB_SECRET: NUMBERSANDLETTERS
```
* Run `rake db:migrate`.
* Run `rake db:seed` to add the organization flatiron-school-students to the organizations table. If you would like to add more oragnizations, add them db/seeds.rb and re-run  `rake db:seed`.
* Run local server with `rails s` and go to `http://localhost:3000/` in your browser before logging in via GitHub.
* Set `User.last.update(:admin => true)` in the `rails console` to become an admin.

## TODO

1. ~~Integrate PDF.JS~~
2. ~~Add method for copying the url of pages~~
3. ~~Slugify book name for params (instead of having ID)~~
4. ~~Add way to make cover photo of PDFs~~
5. ~~Add tags~~
6. Better UX for mobile
7. Figure out why `Automatic Zoom` on the `books/show` page has a weird character in the letter `m`
8. Fix or disable the mulitple thumbnail page view on the `books/show` page that cuts pages off vertically
9. Enhance the speed of the heroku app
10. Flesh out downloading count to then have licensing countdown
11. Add feature to manually upload cover photo in case PDF processing/epub processing doesn't yield one
12. Fix the `fix unresolved uploads` feature on the admin page
13. Support CHMs

## Author

[Flatiron School](http://flatironschool.com/)

## License

My Spiffy App is MIT Licensed. See LICENSE for details.

## Resources
* [PDF.js](http://www.askapache.com/javascript/pdf-js.html)-[Page Number Docs](http://www.askapache.com/javascript/pdf-js.html#Options_after_the-s0)

## For My Own Reference
* Pushing to Heroku Staging Remote:Beta - `git push beta beta:master` 
* Logs for Heroku Staging Remote:Beta - `heroku logs --tail --app beta-library`
* Running Rails Console in Heroku Staging Remote:Beta: `heroku run rails c --app beta-library`

