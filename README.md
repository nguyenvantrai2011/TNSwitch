# TNSwitch
Custom UISwitch with animation when on and off in Objective-C language. 

Thank to @Khoi Nguyen with Swift version. (https://github.com/knn90/Switcher)

In my version: 
- I'm not use IBOutlet, that user can use many TNSwitch in 1 page.
- Can modify on/off status, on/off image name and on/off backgound in storyborad.

## Usage
1. Add TNSwitch class to your project
2. In storyboard, at UIView you would like to custom switch, change UIView class to TNSwitch
2. Conform protocol TNSwitchChangeValueDelegate to handle value changed event

## Screenshot
![](/TNSwitch.gif) 

##License
The MIT License (MIT)

Copyright (c) 2016 Trai Nguyen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
