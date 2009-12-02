function f
  if echo -n $argv[1] | grep '.git$' >/dev/null
    cd $PROJECTS
    git clone $argv
    cd (echo -n $argv[1] | egrep -io '/([^/]+)\.git$' | sed -E 's/\/|\.git//g')
  else
  	cd "$PROJECTS/$argv"
	end
end
