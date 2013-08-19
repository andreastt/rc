# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

# Pick up .goproject files to set GOPATH
function chpwd() {
    if [ -r $PWD/.gopath ]; then
        echo "changing GOPATH"
        export GOPATH=$PWD
    fi
}
