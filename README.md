So you've lost your way on the internet
and accidentally come across my dotfiles?
Don't panic.

These configuration files, so called “dotfiles”,
have been collected, massaged and accumulated over many years.
They are set up in such a way that I can easily check out
this repository on a new machine
and get started using it in a comfortable way relatively quickly.

They are shared publicly so that others may take inspiration.
Do note that they are, and always will be, a constant work-in-progress,
as I continously strive to improve my workflow.

I set them up like this when I'm on a new machine:

```
mkdir Code
cd Code
git clone git@github.com:andreastt/dotfiles.git
cd
```

I then symlink the files I need on the current system:

```
ln -s ~/Code/dotfiles/SRC DEST
```

Feel free to reuse any part and let them serve as inspiration.
