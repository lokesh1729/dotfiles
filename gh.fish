# put this in $HOME/.config/fish/functions/gh.fish
function gh
    python $HOME/search_repos.py $argv
end
