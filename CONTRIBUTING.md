This document describes best practices and suggestions for new contributors to `technomagic-dialects`. While these are not strict rules, we appreciate consistency and find that appropriate conventions aid in making sense of the world. If your contributions are initially rejected, please consider whether you can accomplish your goal while more closely adhering to these guidelines.

# Writing conventions

The following list highlights the most important conventions for all dialects. See also the [Style guide](https://github.com/meitar/technomagic-dialects/wiki/Style-guide), located in the [wiki](wiki/) folder, for additional details.

* Commands, instructions, or invocations should be written using "natural language," which often means space-separated. There are a few exceptions, which should be dash-separated (`-`) instead, but these should not be the norm.

## Manual pages

Each command should have a corresponding manual page. The following manual page sections are *required*:

* [`NAME`](#name)
* [`SYNOPSIS`](#synopsis)
* [`DESCRIPTION`](#description)
* [`AUTHORS`](#authors)

In addition to the above, the following manual page sections are *optional*, but recommended:

* [`ENVIRONMENT`](#environment)
* [`EXAMPLES`](#examples)
* [`SEE ALSO`](#see-also)
* [`NOTES`](#notes)
