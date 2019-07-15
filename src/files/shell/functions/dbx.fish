function dbx --wraps direnv --description 'alias dbx=direnv exec . bundle exec'
    direnv exec . bundle exec $argv
end
