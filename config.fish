#:qif status is-interactive
#    # Commands to run in interactive sessions can go here
#end

function gdf
    set -l commit_diff (string join ' ' $argv)
    git diff -U0 HEAD~$commit_diff.. | ./contrib/devtools/clang-format-diff.py -p1 -i -v
end


function change_origin
    set -l new_origin (string join ' ' $argv)
    git remote set-url origin https://github.com/$new_origin/bitcoin
end

# Create the abbreviation
# Git abbreviations
abbr -a git-df 'gdf'
abbr -a git-sh 'git show'
abbr -a git-pu 'git push origin'
abbr -a git-c 'git commit -S'
abbr -a git-r- 'git rebase -i -S HEAD~'
abbr -a git-cont-r 'git rebase --continue'
abbr -a git-change_origin 'change_origin'
abbr -a git-pull 'git pull origin'
abbr -a git-chk-o 'git remote -v'
abbr -a git-add-work-tree 'git worktree add'

# Bitcoin core Build system abbreviation
abbr -a test-func- 'build/test/functional/'
abbr -a test-unit 'build/bin/test_bitcoin'
abbr -a see-config 'cmake -B build -LH'
abbr -a configure-btc 'cmake -B build -DBUILD_GUI=OFF -DWITH_BDB=OFF'
abbr -a b-cli-r './build/bin/bitcoin-cli -regtest'
abbr -a start-btc-r './build/bin/bitcoind -regtest'

# Dockeri
abbr -a docker-lint 'DOCKER_BUILDKIT=1 docker build -t bitcoin-linter --file "./ci/lint_imagefile" ./ && docker run --rm -v $(pwd):/bitcoin -it bitcoin-lintergi'
abbr -a dcr 'docker container rm '
