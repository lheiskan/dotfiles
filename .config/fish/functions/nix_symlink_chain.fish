
# SHOW full symlink chains
# useful to understand how stuff is linked in Nix
function nix_symlink_chain
    if test (count $argv) -eq 0
        set target $PWD
    else
        # Normalize: remove trailing slashes
        set target (string replace -r '/+$' '' $argv[1])
    end

    set depth 0

    while test -L "$target"
        set dir (dirname "$target")
        set link_target (readlink "$target")

        # Show both the symlink and its raw target
        echo "[$depth] $target -> $link_target"

        # Prepare the next target (resolve relative paths)
        if string match -q '/*' $link_target
            set target $link_target
        else
            set target $dir/$link_target
        end

        set depth (math "$depth + 1")
    end

    echo "[$depth] final target: $target"
end

