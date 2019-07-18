function git-exclude --description="Add a line to the local .git/info/excludes file"
  set -l repo_dir (git rev-parse --show-toplevel)
  if [ $status -eq 0 ]
    echo "$argv" >> "$repo_dir/.git/info/exclude"
    echo "added '$argv' to the exclude file"
  end
end
