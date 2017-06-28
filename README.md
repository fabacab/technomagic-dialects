# Technomagic Dialects

Contained herein are a set of simple aliases and symbolic links making up a "dialect" with which you can "speak" to a POSIX-conformant shell. It helps you think about computer commands using metaphors other than "computer commands," importing various metaphors sourced from differing cultural contexts. These include, for example, a "text based game" such as an old-school MUD or RPG, pop-cultural references such as Harry Potter spells, and other, more esoteric cultural dialects.

![Animated GIF showing the use of the locking and unlocking charms on a macOS system from the Harry Potter dialect.](https://i.imgur.com/NhE2S80.gif)

For example, on macOS, you can "lock" files using the Finder's graphical Inspector (also known as the "Get Info" window): command-click (or right-click) on a file on your desktop, select "Get Info" from the contextual menu, and check the "Locked" checkbox. Once a file is "locked," it must first be "unlocked" before it can be changed or accessed in certain ways. In the Desktop metaphor (the default, ubiqutitous computing metaphor popularized by the Mac OS classic and Windows "Desktop Environments"), you again access the "Get Info" window, and must uncheck the "Locked" checkbox. On a command line, the same can be accomplished using the `chflags(1)` command of a macOS system:

```sh
chflags nouimmutable $file # Invoke the macOS chflags command, negating the "user immutable" flag on "$file"
```

Using the Harry Potter dialect, however, the same can be accomplished by reciting the incantation for the [Unlocking Charm](https://harrypotter.wikia.com/wiki/Unlocking_Charm) or the [Locking Spell](https://harrypotter.wikia.com/wiki/Locking_Spell), and the two spells will do what you expect:

```sh
alohomora $file   # Casts the unlocking charm on a file. If it is locked, it will now be unlocked.
colloportus $file # You can of course also (re-)lock files using the locking spell.
```

Similarly, after activating the "text based game" dialect, you can move around and explore a filesystem using a gaming analogy:

```sh
"where am I?"      # This is the equivalent of `pwd(1)`
/Users/demouser
"look around"      # This is an equivalent of `ls(1)`
Desktop        Movies       Public
Documents      Music        Sites
Downloads      Pictures
"move-to" Desktop  # This is an equivalent of `cd(1)`
"where am I?"
/Users/demouser/Desktop
```

Notice that shell syntax is still in effect, and you must quote so-called "commands" that contain spaces. We are still "using a computer." We are just *thinking about* doing so in one of a number of infinite different ways, and in so doing choosing one of an infinite number of experiences to have while we are doing so.

For many people, one of these different metaphors will be more comfortable or will simply feel better than the "Desktop" metaphor, which often invokes coercive and stressful employment scenarios. Fuck. That. Shit.

# Installation

Installation requires downloading the code for the dialects contained in this repository and then adding a directory to your computer's default shell's `$PATH` variable. For instance, if you're using Bash:

```sh
git clone https://github.com/meitar/technomagic-dialects.git              # Download the source code.
echo "PATH=$PATH:$(pwd -P)/technomagic-dialects/src/bin" >> ~/.bash_login # Append the technomagic-dialect's bin directory to your Bash shell's auto-sourced PATH.
```

If all goes well, you can now [activate any or all dialects](#activating-dialects) provided by this repository.

# Activating dialects 

A dialect must be activated before it can be used. To activate a dialect, use the built-in `source` command:

```sh
source dialect "text based game" # Activates the "text based game" dialect.
source dialect "harry potter"    # Activates the "harry potter" dialect.
```
