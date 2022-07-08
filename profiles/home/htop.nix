{
  programs.htop = {
    enable = true;
    settings = {
      show_program_path = false;
      sort_key = "M_RESIDENT";
    };
  };
}
