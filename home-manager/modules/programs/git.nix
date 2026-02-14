_: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Axel";
        email = "axelmychro@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
