create/%:
	maltmill new -w kayac/$*

update/%:
	maltmill -w $*.rb

update-all:
	grep -l darwin *.rb | grep -v @ | xargs -n 1 maltmill -w

test/%:
	brew install --build-from-source $*
