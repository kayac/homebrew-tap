create/%:
	maltmill new -w kayac/$*

update/%:
	maltmill -w $*.rb

update-all:
	grep -l darwin *.rb | xargs -n 1 maltmill -w
