# aliases for pushd and popd (and also list directory contents)
alias pd='pushd && ls'
alias po='popd && ls'

# aliases for encoding and decoding url strings
alias urlencode='python3 -c "import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]))"'
