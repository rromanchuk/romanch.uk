if [ "$DEPLOYMENT_GROUP_NAME" == "production" ]
then
  eval "$(shdotenv -e ${HOME}/.env)"
  printenv

  cd /var/www/romanch.uk
  # Get a list of directories starting with 'd-', sorted by modification time (newest first)
  directories=$(ls -dt d-*)

  # Counter to keep track of how many directories have been processed
  count=0

  # Iterate over the sorted list of directories
  for dir in $directories; do
    ((count++))  # Increment the count for each directory processed
    if [ $count -gt 3 ]; then
      echo "Deleting older directory: $dir"
      rm -rf "$dir"  # Delete the directory if it is not among the 3 most recent
    else
      echo "Keeping directory: $dir"
    fi
  done
fi