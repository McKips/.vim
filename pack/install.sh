#!/usr/bin/env bash
# Create new folder in !/.vim/pack that contains a start folder and cd into it
#
# Arguments:
#	package_group, a string folder name to create and change into
#
# Examples:
# set_group syntax-hightlighting
#
function set_group() {
	package_group=$1
	path="$HOME/.vim/pack/$package_group/start"
	mkdir -p "$path"
	cd "$path" || exit
}
# Clone or update a git repo in the current directory
#
# Arguments:
# repo_url, a URL to the git rep
#
# Examples:
#	Package https://github.com/tpope/vim-endwise.git
#
function package() {
	repo_url=$1
	expected_repo=$(basename "$repo_url" .git)
	if [ -d "$expected_repo" ]; then
		cd "$expected_repo" || exit
		result=$(git pull --force)
		echo "$expected_repo: $result"
	else
		echo "$expected_repo: Installing..."
		git clone -q "$repo_url"
	fi
}

(
set_group syntax
package https://github.com/vim-airline/vim-airline.git &
package https://github.com/vim-airline/vim-airline-themes.git &
package https://github.com/ajh17/VimCompletesMe.git &
package https://github.com/Rip-Rip/clang_complete.git & 
package https://github.com/w0rp/ale.git &
package https://github.com/tpope/vim-surround.git &
package https://github.com/Raimondi/delimitMate.git &
wait
) &

(
set_group colorschemes
package https://github.com/tomasr/molokai.git &
package https://github.com/altercation/vim-colors-solarized.git &
wait
) &

(
set_group trackChanges
package https://github.com/tpope/vim-fugitive.git &
package https://github.com/airblade/vim-gitgutter.git &
package https://github.com/vim-scripts/vim-auto-save.git &
wait
) &

(
set_group navigation
package https://github.com/christoomey/vim-tmux-navigator.git &
package https://github.com/scrooloose/nerdtree.git &
package https://github.com/jistr/vim-nerdtree-tabs.git &
wait
) &
wait
