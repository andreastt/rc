# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

# Pick up .gopath files to set GOPATH
function chpwd() {
    if [ -r $PWD/.gopath ]; then
        export GOPATH=$PWD
    fi
}
