#!/bin/sh

# Emit an arbitrary byte-sequence to standard output
putBytes(){
	printf %b `printf \\\\%03o "$@"`
}

CSI=`putBytes 27 91`

echo Before
printf 'travis_fold:start:foobar_etc\r%s0K%s33;1m%s%s0m\n' "$CSI" "$CSI" "Heading goes here" "$CSI"
echo Foo
echo Bar
echo Baz
printf 'travis_fold:end:foobar_etc\r%s0K' "$CSI"
echo After
