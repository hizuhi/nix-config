{pkgs, config, ...}:
{
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            github.copilot
            ms-python.python
            ms-python.debugpy
            ms-vscode.cpptools
            ms-vscode.cmake-tools
            oderwat.indent-rainbow
            zaaack.markdown-editor
            ms-vscode-remote.remote-ssh
            dracula-theme.theme-dracula
            jnoortheen.nix-ide
        ];
    };
}
