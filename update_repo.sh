source helper.sh
rm -f .commit_hash

helper "repo dir not found" pushd $1 1> /dev/null
helper "cant reset git" git reset --hard HEAD

COMMIT=$(helper "cant call 'git log' on repo" git log -n1)
if[$? != 0]; then
  echo "cant call 'git log' on repo"
  exit 1
fi

HASH=`echo $COMMIT | awk '{print $2}'`

helper "cant pull from repo" git pull

COMMIT=