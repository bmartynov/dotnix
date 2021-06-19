{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableNixDirenvIntegration = true;
    
    nix-direnv.enable = true;
    nix-direnv.enableFlakes = true;
  };
}
