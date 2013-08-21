# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

# Update GOPATH depending on which Go project you're currently
# traversing.
#
# Sets environmental variable GOPATH if any parent directories has
# both a .gopath file and a ./src directory in it.  Correspondingly it
# unsets the variable if the previous condition is not true.
function update_gopath() {
    c="$PWD"

    while [[ "`/bin/readlink -f $c`" != "/" ]];
    do
        if [ -f $c/.gopath ] && [ -d $c/src ]; then
            export GOPATH=$PWD
            return
        fi
        c=${c}/..
    done

    unset GOPATH
}

function chpwd() {
    update_gopath
}
