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

As is standard UNIX practice, you can look up more information about individual incantations from their manual page. In the Harry Potter dialect, the equivalent of the `man(1)` command is `"book of spells"`. Try `"book of spells" "book of spells"` to learn more about how to use the [Book of Spells](https://harrypotter.wikia.com/wiki/Book_of_Spells).

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

# Developing

In this repository you will find a [`src`](src/) directory. This directory holds more contemporary versions of source material that is later used, through various incantations, for manifesting the ultimately desired output. In this way, human editors can more easily contribute to and read the source material itself. We use [`md2man`](https://github.com/sunaku/md2man) for the translation between contemporary human scripts and the arcane syntaxes of various UNIX-like manual page formats.

## Prerequisites

First, ensure you have installed the following, in the following order:

* [Git](https://git-scm.com/)
    * Test this by asking your system to report its Git version number: `git --version`
* [Ruby](https://www.ruby-lang.org/) (version 2.0 or later is recommended)
    * Test this by asking your system to report its Ruby version number: `ruby --version`
* [Bundler](https://bundler.io/)
    * Test this by asking your system to report its Bundler version number: `bundler --version`

## Set up

Once the prerequisites are installed, clone the repository from GitHub (or a mirror), and then use `bundler` to install the development dependencies. An example installation, with output, is shown below:

```sh
$ cd technomagic-dialects              # Change to the technomagic-dialects folder.
$ bundle install --path vendor/bundle  # Install the listed dependencies.
Fetching gem metadata from https://rubygems.org/...
Fetching version metadata from https://rubygems.org/.
Resolving dependencies...
Rubygems 2.0.14 is not threadsafe, so your gems will be installed one at a time. Upgrade to Rubygems 2.1.0 or higher to enable parallel gem installation.
Installing opener 0.1.0
Installing redcarpet 3.4.0 with native extensions
Installing rouge 1.11.1
Using bundler 1.14.2
Installing binman 5.1.0
Installing md2man 5.1.1
Bundle complete! 1 Gemfile dependency, 6 gems now installed.
Bundled gems are installed into ./vendor/bundle.
```

Once [installed](#installation) and a given dialect [activated](#activating-dialects), you can generate individual manual pages from the files in the `src` directory and view them in your manual page viewer as follows:

```sh
./utils/build.sh --force-clean # Use the build script to clean and regenerate the docs.
man "look around"              # View generated documentation with the man page viewer.
```
