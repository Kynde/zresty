# zresty

zresty is a zsh resty-like command line tool for testing restful apis powered by httpie.

It borrows its idea from [resty](https://github.com/micha/resty) which
allows setting the static section of the api uri beforehand and then sets up quick access
methods for the variable part. Instead of `curl` the zresty uses the
awesome [httpie](https://github.zom/jkbrzt/httpie).

![Example][]

## Quick Start

If you don't have [httpie](https://github.zom/jkbrzt/httpie), then get it first.
It's availabe with `apt-get`, `yum`, `dnf`, `brew` and `pip` at least.

Try zresty with

```
# curl -L http://github.com/kynde/zresty/raw/master/zresty > zresty
# . ./zresty
```

or clone the repo and source it from there in your .zshrc like

```
git clone https://github.com/kynde/zresty ~/.zsh/zresty
echo '. ~/.zsh/zresty/zresty' >> ~/.zshrc
```

## Usage

```
usage: z [OPTIONS] <URI>

Most options are passed onto http upon each invocation of http methods.
The special option is -H <HTTP-PARAMS> which can be used to pass headers to http for example
Without URI it prints out current options and URI

zresty methods:
	get post put delete

zresty method options:
	currently none

example:
	# . zresty
	# z :3000/api/1.0
	# get /ping
```

The defaults are lowercase commands z,get,pust,post and delete. Head, patch and options
have been left out because they're not very common and tend to conflict with some
actual commands. Lowercase was chosen because they're easier to type, but that's
easy to change.

The default options are `-b` for body only. This is because it allows easy manipulation with [jq](https://github.com/stedolan/jq), e.g. `get /user | jq .name`.

If any options are given to the call to `z`, that default is overridden.

An api-key can be set using -H and headers, e.g.
```
    # z -b -H api-key:FOOBAR http://some.where/api
```

## Dependencies

The [httpie](https://github.com/jkbrzt/httpie) is needed.

## Why?

I really liked the idea of `resty`, but I'd gotten too used to the powerful
arguments and colours of `httpie` to let it go.

## Bash?

Why not, I don't use it, but go ahead and I'll be happy merge a pull request.

[Example]: https://github.com/kynde/zresty/raw/master/zresty.png
