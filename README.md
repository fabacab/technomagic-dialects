# Technomagic Dialects

Contained herein are a set of simple aliases and symbolic links making up a "dialect" with which you can "speak" to a POSIX-conformant shell. It helps you think about computer commands using metaphors other than "computer commands," importing various metaphors sourced from differing cultural dialects. These include, for example, a "text based game" such as an old-school MUD or RPG, pop-cultural references such as Harry Potter spells, and other, more esoteric cultural dialects.

For example, on macOS, you can "lock" files using the Finder's graphical Inspector (also known as the "Get Info" window). Command-click (or right-click) on a file on your desktop, select "Get Info" from the contextual menu, and check the "Locked" checkbox.

Once a file is "locked," it must first be "unlocked" before it can be changed or accessed in certain ways. In the Desktop metaphor (the default, ubiqutitous computing metaphor popularized by the Mac OS classic and Windows "Desktop Environments"), you again access the "Get Info" window, and must uncheck the "Locked" checkbox. On a command line, the same can be accomplished using the `chflags(1)` command of a macOS system:

```sh
chflags nouimmutable $file # Invoke the macOS chflags command, negating the "user immutable" flag on "$file"
```

Using the Harry Potter dialect, however, the same can be accomplished by reciting the incantation for the [Unlocking Charm](https://harrypotter.wikia.com/wiki/Unlocking_Charm):

```sh
alohomora $file
```

Similarly, after activating the "text based game" dialect, you can move around and explore a filesystem using a gaming analogy:

```sh
"where am I"     # This is the equivalent of `pwd(1)`
/Users/demouser
"look around"    # This is an equivalent of `ls(1)`
Desktop        Movies       Public
Documents      Music        Sites
Downloads      Pictures
move-to Desktop
"where am I"
/Users/demouser/Desktop
```
