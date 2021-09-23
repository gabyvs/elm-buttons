This project contains several Elm exercises from the [Elm documentation](https://guide.elm-lang.org/)

The easiest way to run each exercise is to rename any (but only one) of the files inside `src` to be just `Main.elm` and then run  `elm make ./src/Main.elm --output elm.js`.  After that is done, you can just open `index.html` on your browser.

Otherwise, you would need to change all references to match:
- Module name inside the file to match the file name
- init line inside `index.html` to call the module instead of `Main`
- elm make command to build the file that you want
