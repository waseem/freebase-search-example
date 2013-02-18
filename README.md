# Freebase Search Example
A single page jQuery Web Application.

As the user starts typing in words, the application should query Freebase (using [Search Service](http://wiki.freebase.com/wiki/ApiSearch) ) and get various results.
Each result, then, should form a box on the page. Each box contains a title, a category, an image, some description about the result.
The client fetches description & image from [Freebase' Text](http://wiki.freebase.com/wiki/ApiText) & [Image Services](http://wiki.freebase.com/wiki/ApiImage).

For example, if I type Nirvana, then the various boxes might be telling me about the Belief, the Musical Group, the Movie, or maybe about Gautam Buddha. Essentially, this is a Freebase-based topic search engine. It'd be good if you can hyperlink these boxes to the topic on Freebase.

As the user starts typing more text, the application should wait for the user to stop typing. After some 400ms of stopped typing, the requests are to be sent to Freebase.

Optionally, you can arrange the results using [jQuery Masonry](http://masonry.desandro.com/).

## Development

All application specific code is under `coffeescript` directory. To develop agains this application, run `coffee -cw coffeescript` in your terminal. This will watch for changes and compile the `.coffee` files to `.js` files in the same directory.
 

## License

This application is licensed under the MIT license. It may be used for personal and commercial applications.

### The MIT License

Copyright © 2013 Waseem Ahmad

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
