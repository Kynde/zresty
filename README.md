# zresty

zresty is a zsh resty powered by httpie. It borrows its idea from _micha/resty_, but switches
curl to _jkbrzt/httpie_.

## Quick Start

```
$ z http://localhost:3001/api/1.0
http://localhost:3001/api/1.0*
$ get /ping
{
	"name": "giraffi",
	"version": "0.1.0"
}
$ get /user/list
[ 1, 2, 3 ]
$ post /user name=Richard age=12
{
	"id": 4,
	"name": "Richard",
	"age": 12
}
$ get /user/4 | jq -r .name
Richard
$ for i in $( get /user/list | jq -r .[] ) ; do get /user/$i | jq .name ; done
Daniel
Sam
Christopher
Richard
```

## Usage

```
usage: z [OPTIONS] <URL>

Options will be passed onto httpie. The given url will be used as a prefix for url given to
http methods.

zresty itself currently doesn't have any options.
```

The default is lowercase commands z,get,pust,post,delete. Head and options have been discarded
because they're not the common case and tend to conflict with actual commands. Lowercase was
chosen because they're easier to type, but that's easy to change.

The default options are `-b`, but given any options to the call to `z`, that default is then
discarded.

