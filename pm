originaldir=$PWD

cd ~/package-manager

if [ ! "$3" == "-d" ]; then
  echo downloading...
  git clone -q https://github.com/$1/$2 || exit 100
  echo done.
fi

if [ "$3" == "-d" ]; then
  echo deleting $2
else
  echo installing...
fi

cd $2
if [ -f build.pm ]; then
  if [ "$3" == "-d" ]; then
    ./uninst.pm
  else
    ./build.pm
  fi
fi

cd ..

if [ "$3" == "-d" ]; then
  rm -rf $2
fi

cd $originaldir
