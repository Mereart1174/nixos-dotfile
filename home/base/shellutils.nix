{
 # zoxide is a smarter cd command, inspired by z and autojump.
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # Atuin replaces your existing shell history with a SQLite database,
  # and records additional context for your commands.
  # Additionally, it provides optional and fully encrypted
  # synchronisation of your history between machines, via an Atuin server.
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.zellij = {
    enable = true;
  };
}
