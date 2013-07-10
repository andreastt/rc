ato's dotfiles
==============

So you've lost your way on the internet and accidentally come across
my dotfiles?  Don't worry, it's not too insane.

These configuration files, so called “dotfiles”, have been collected,
massaged and accumulated over many years.  They are set up in such a
way that I can easily check out this repository on a new machine and
get started using it in a comfortable way relatively quickly.

The typical approach I use is the following:

::

    mkdir dev
    cd dev
    git clone https://github.com/andreastt/dotfiles.git
    cd

And then iterating with the following command on the files I need:

::

    ln -s ~/dev/dotfiles/FILE

Probably I should write a script to do that work for me automatically.

Feel free to reuse any part and let these dotfiles serve as
inspiration.
