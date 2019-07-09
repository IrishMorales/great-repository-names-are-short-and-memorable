#!/bin/sh

# Emit an arbitrary byte-sequence to standard output
putBytes(){
	printf %b `printf \\\\%03o "$@"`
}

# Output a control-sequence introducer for an ANSI escape code
csi(){
	putBytes 27 91
}

# TravisCI: Begin a named folding region
startFold(){
	if [ ! "$TRAVIS_JOB_ID" ]; then return; fi
	set -- "$1" "`csi`"
	printf 'travis_fold:start:%s\r%s0K' "$1" "$2"
}

# TravisCI: Close a named folding region
endFold(){
	if [ ! "$TRAVIS_JOB_ID" ]; then return; fi
	set -- "$1" "`csi`"
	printf 'travis_fold:end:%s\r%s0K' "$1" "$2"
}

echo Before
startFold foobar_etc1
printf '%s33;1m%s%s0m\n' "`csi`" "1. Heading goes here" "`csi`"
echo Foo
echo Bar
startFold foobar_etc1.1
printf '%s33;1m%s%s0m\n' "`csi`" "1.1 Heading goes here" "`csi`"
echo - Foo
echo - Bar
echo - Baz
endFold foobar_etc1.1
echo Baz
echo Etc
endFold foobar_etc1
echo After
