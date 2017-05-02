# painfully-slow-typing
This command line application makes typing on your Mac *painfully slow*, rightfully so?
It is an experimental approach to introduce #waiting into human-computer-interaction.

![showing v1 at use](https://cloud.githubusercontent.com/assets/1216324/25635381/3acdc1cc-2f7e-11e7-852d-f1bc8a070568.gif)

## behaviour
when the application is running, keyboard events will be intercepted and discarded if occuring within a specified amount of time (2 seconds).
(all other events, e.g. mouse movement, stay unchanged.)

There are two [versions](https://github.com/jelko/painfully-slow-typing/releases) available:

* v1.0 will pause 2 seconds after each keystroke
* v2.0 will pause 2 seconds between words (after SPACE and ENTER)

## run
Run on terminal as root (otherwise keyboard events can not be intercepted):

    sudo ./painfullyslowtyping_X

Quit the application or Terminal to get back to speed.

## build
download the xcode project and play arround. the code is super straightforward.
(be sure to have Automatic Reference Counting (ARC) disabled.)


*I used v2 to write this README. It took 15 minutes.*
