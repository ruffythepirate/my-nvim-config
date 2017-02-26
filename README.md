# Installation for Mac

## Placement

Clone this repository into `~/.config/nvim`

## Python

1. `brew install python` or `brew upgrade python` if you have an old version.

## Install Ensime (for scala development)

1. `pip2 install neovim`
2. `pip2 install sexpdata websocket-client`
3. Install ensime for your build tool. For SBT see here: http://ensime.org/build_tools/sbt/
4. Remember to add .ensime and .ensime_cache to .gitignore in your project.
5. In sbt for your project run `ensimeConfig`
6. Run `:UpdateRemovePlugin` from nvim and restart.
7. When you start your project the first time, run `:EnInstall`, which should spawn a background service.

### Troubleshooting

Read up on the vim pages here: http://ensime.org/editors/vim/workflow/

## Install NeoVim

1. https://github.com/neovim/neovim/wiki/Installing-Neovim
2. alias vim=nvim
3. On startup, nvim will ask you to install bundles, select "y" and the installation starts. It can take a while.
4. YouCompleteMeNow fails on the first install. That is ok, just restart. 

## Install Exuberant Ctags 

1. brew install ctags
2. alias ctags="\`brew --prefix\`/bin/ctags"

## Making Ctags work for your project

The following instructions are taken from https://github.com/ceedubs/sbt-ctags

1. Make sure that Exuberant Ctags has been setup on your machine.
2. Add the following configuration to your `~/.sbt/0.13/plugins/plugins.sbt`
`resolvers ++= Seq(
  "Sonatype OSS Releases" at "https://oss.sonatype.org/content/repositories/releases/",
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots/"
)
addSbtPlugin("net.ceedubs" %% "sbt-ctags" % "0.2.0")`
3. Configure .ctags to work for scala by adding this to your `~/.ctags` file:
`--langdef=scala
--langmap=scala:.scala
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private|protected)?[ \t]*class[ \t]+([a-zA-Z0-9_]+)/\4/c,classes/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private|protected)?[ \t]*object[ \t]+([a-zA-Z0-9_]+)/\4/c,objects/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private|protected)?[ \t]*case class[ \t]+([a-zA-Z0-9_]+)/\4/c,case classes/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private|protected)?[ \t]*case object[ \t]+([a-zA-Z0-9_]+)/\4/c,case objects/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*(private|protected)?[ \t]*trait[ \t]+([a-zA-Z0-9_]+)/\4/t,traits/
--regex-scala=/^[ \t]*type[ \t]+([a-zA-Z0-9_]+)/\1/T,types/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*def[ \t]+([a-zA-Z0-9_]+)/\3/m,methods/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*val[ \t]+([a-zA-Z0-9_]+)/\3/l,constants/
--regex-scala=/^[ \t]*((abstract|final|sealed|implicit|lazy)[ \t]*)*var[ \t]+([a-zA-Z0-9_]+)/\3/l,variables/
--regex-scala=/^[ \t]*package[ \t]+([a-zA-Z0-9_.]+)/\1/p,packages/`
4. Configure the sbt plugin to use the exuberant version of ctags (and not the default one that comes with xcode command line tools). Add this to a file called `~/.sbt/0.13/sbt-ctags.sbt`:
```
import net.ceedubs.sbtctags.CtagsKeys

CtagsKeys.ctagsParams ~= (_.copy(executable="/usr/local/bin/ctags", languages = Seq("scala")))
```
Where `/usr/local/bin/ctags` is the path to your copy of exuberant ctags. (mine is downloaded through homebrew)

5. You then also need to generate the tags for the project. Do this by running `sbt gen-ctags` in your project.
