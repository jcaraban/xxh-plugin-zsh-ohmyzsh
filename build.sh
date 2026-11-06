#!/usr/bin/env bash
set -eo pipefail

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

if [ ! -x "$(command -v git)" ]; then
  echo Install git
  exit 1
fi

rm -rf $build_dir
mkdir -p $build_dir
cp $CDIR/pluginrc.zsh $build_dir/

[ $QUIET ] && arg_q='-q' || arg_q=''

ohmyzsh_home=$build_dir/ohmyzsh
git clone $arg_q --depth 1 https://github.com/ohmyzsh/ohmyzsh.git $ohmyzsh_home
for plugin in zsh-completions zsh-autosuggestions zsh-syntax-highlighting
do
  git clone $arg_q --depth 1 https://github.com/zsh-users/$plugin $ohmyzsh_home/custom/plugins/$plugin
done
