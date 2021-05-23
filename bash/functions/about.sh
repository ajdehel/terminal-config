
function about {
  local usage="Usage:\n"
       usage+="$> about [dirname]\n"
  if [[ 2 -le $# ]]; then
    echo -e $usage
    return 1;
  fi
  if [[ 0 -ne $# ]]; then
    local path=$1
  else
    local path=$PWD
  fi
  if [[ ! -d $path ]]; then
    echo -e $usage
    return 1;
  fi
  find $path -maxdepth 1 -iname readme* -exec more '{}' \;
}
