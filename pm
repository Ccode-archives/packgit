
error () {
  echo already downloaded! Aborting...
  exit 100
}
originaldir=$PWD

cd ~/package-manager

if [ ! "$3" == "-d" ]; then
  echo downloading...
  git clone -q https://github.com/$1/$2 >> /dev/null || error
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
    chmod +x uninst.pm
    ./uninst.pm
  else
    chmod +x build.pm
    ./build.pm
  fi
fi

cd ~/package-manager

if [ "$3" == "-d" ]; then
  rm -rf $2
fi

cd $originaldir
