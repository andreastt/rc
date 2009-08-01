function fc
  set -l PROJECT (echo -n $argv[1] | egrep -io '/([^/]+)\.git$' | sed -E 's/\/|\.git//g')
  cd $PROJECTS
  git clone $argv
  cd $PROJECT
end
