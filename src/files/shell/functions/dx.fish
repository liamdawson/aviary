function dx --wraps direnv --description 'alias dx=direnv exec .'
    direnv exec . $argv
end
