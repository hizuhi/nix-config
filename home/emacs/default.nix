{ pkgs, config, lib, spacemacs, ... }:
let
  # User configuration directory for Spacemacs
  spacemacsDotD = "${config.home.homeDirectory}/nix-config/home/emacs/spacemacs.d";
  homeDir = config.home.homeDirectory;
in
{
  # Keep user config under version control
  home.file.".spacemacs.d".source = config.lib.file.mkOutOfStoreSymlink spacemacsDotD;

  # Ensure a writable ~/.emacs.d populated from the flake input on activation
  home.activation.syncSpacemacs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    set -eu
    SPDIR="${homeDir}/.emacs.d"
    # Ensure ~/.emacs.d is a real directory, not an old symlink
    if [ -L "$SPDIR" ] || [ -f "$SPDIR" ]; then
      rm -rf "$SPDIR"
    fi
    # A legacy ~/.emacs can shadow ~/.emacs.d/init.el; back it up if present
    if [ -e "${homeDir}/.emacs" ]; then
      mv -f "${homeDir}/.emacs" "${homeDir}/.emacs.hm-bak"
    fi
    mkdir -p "${homeDir}/.cache" "${homeDir}/.local/share" "$SPDIR"
    # Sync Spacemacs code but keep elpa and .cache writable in $SPDIR
    # Do not preserve permissions so that files become writable by the user
    ${pkgs.rsync}/bin/rsync -rlt --delete \
      --exclude 'elpa/' \
      --exclude '.cache/' \
      --exclude '.git/' \
      "${spacemacs}/" "$SPDIR/"
    chmod -R u+rwX "$SPDIR"
    mkdir -p "$SPDIR/elpa" "$SPDIR/.cache"
  '';

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  # Help Spacemacs locate user config directory explicitly
  home.sessionVariables.SPACEMACSDIR = "${homeDir}/.spacemacs.d";
}
