{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jonathan";
  home.homeDirectory = "/home/jonathan";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  home.packages = [
    pkgs.rust-analyzer
  ];

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ 
      idris2-vim
      vim-lsp
    ];
    extraConfig = ''
      if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif
    '';
  };

  programs.git = {
    enable = true;
    userName = "jonathanrlouie";
    userEmail = "jonathanrlouie@gmail.com";
  };
}
