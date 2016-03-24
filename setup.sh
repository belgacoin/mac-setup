#!/usr/bin/env bash

echo ""
echo ">> Updating Homebrew along with formulae."
echo ""

brew update

brewsy=`brew outdated | wc -l | awk {'print $1'}`

if [ $brewsy != 0 ]; then
  echo ""
  echo "------------------------------"
  echo "List of outdated packages."
  echo "------------------------------"
  echo ""

  brew outdated

  echo ""
  read -r -p ">> Update these packages? [Y n] " response

  if [[ $response =~ ^(yes|y| ) ]] | [ -z $response ]; then
    echo ""
    echo "------------------------------"
    echo "Upgrading outdated formulae and apps."
    echo "This might awhile to complete, as some formulae need to be installed from source."
    echo "------------------------------"
    echo ""

    brew upgrade --all

    echo ""
    echo "------------------------------"
    echo "Cleaning up old versions."
    echo "------------------------------"
    echo ""

    brew cleanup

  else
    echo ""
    echo ">> OK. Not doing anything."
    echo ""
  fi

else
  echo ""
  echo "------------------------------"
  echo "Nothing to do."
  echo "------------------------------"
  echo ""
fi
