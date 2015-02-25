# A Simple MUMPS Interface

This streamlined [MUMPS](http://mumps-solver.org) API is suitable for
writing interfaces in high-level languages such as
[Julia](http://julialang.org) or [Python](http://python.org).

A Julia interface is available in [MUMPS.jl](https://github.com/dpo/MUMPS.jl).

## How to Install

On OSX and Linux, `mumps_simple` is already installed with `mumps` if you use
[Homebrew](https://brew.sh) or [LinuxBrew](http://brew.sh/linuxbrew). It is
sufficient to
````
brew tap homebrew/science
brew install mumps
````

If you don't use LinuxBrew, customize the `Makefile` to reflect your system
settings and type `make`.

This content is released under the [MIT](http://opensource.org/licenses/MIT) License.
<a rel="license" href="http://opensource.org/licenses/MIT">
<img alt="MIT license" height="40" src="http://upload.wikimedia.org/wikipedia/commons/c/c3/License_icon-mit.svg" /></a>
