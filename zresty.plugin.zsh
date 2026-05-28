
typeset -g  _zresty_uri=""
typeset -g  _zresty_tool="http"
typeset -ga _zresty_methods=(get post put delete)
typeset -ga _zresty_options=()
typeset -ga _zresty_headers=()

unalias z 2>/dev/null

if (( ! $+commands[http] )) ; then
	echo "error: http not found"
	echo ""
	echo "Your distro might ship it or just get it from:"
	echo "https://github.com/httpie/cli"
	return 1
fi

_zresty_usage() {
	echo "usage: $1 [OPTIONS] <URI>"
	echo ""
	echo "Most options are passed onto http upon each invocation of http methods."
	echo "The special option is -H <HTTP-PARAMS> which can be used to pass headers to http for example"
	echo "Without URI it prints out current options and URI"
	echo ""
	echo "zresty methods:"
	echo "	$_zresty_methods"
	echo ""
	echo "zresty method options:"
	echo "	currently none"
	echo ""
	echo "example:"
	echo "	# . zresty.plugin.zsh"
	echo "	# z :3000/api/1.0"
	echo "	# get /ping"
}

_zresty_status() {
	echo -e "uriprefix:\t$_zresty_uri"
	echo -e "options:\t$_zresty_options"
	echo -e "headers:\t$_zresty_headers"
}

z() {
	if (( $# == 0 )) ; then
		_zresty_status
		return 0
	fi
	if [[ "$1" == "--help" ]] ; then
		_zresty_usage z
		return 0
	fi
	if (( $# > 1 )) ; then
		_zresty_options=()
	else
		_zresty_options=(-b)
	fi
	_zresty_headers=()
	while (( $# > 1 )) ; do
		case $1 in
			-H)
				shift
				_zresty_headers+=("$1")
				;;
			*)
				_zresty_options+=("$1")
				;;
		esac
		shift
	done
	_zresty_uri="$1"
}

for x in $_zresty_methods ; do
	$x() {
		$_zresty_tool $_zresty_options ${0:u} "${_zresty_uri}${1-}" "${@:2}" $_zresty_headers
	}
done
unset x
