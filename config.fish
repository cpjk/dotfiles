if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    # derp
end
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add homebrew ruby to PATH
fish_add_path /opt/homebrew/opt/ruby/bin
