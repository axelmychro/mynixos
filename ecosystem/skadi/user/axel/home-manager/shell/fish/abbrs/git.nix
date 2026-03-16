_: {
  programs.fish.shellAbbrs = {
    g = "git";

    gs = "git status";

    gd = "git diff";
    gds = "git diff --staged";

    gl = "git log";
    gll = "git log --oneline --graph --decorate --all";

    ga = "git add";
    gaa = "git add .";

    gc = "git commit -m";
    gca = "git commit --amend";

    gco = "git checkout";
    gcob = "git checkout -b";

    gb = "git branch";
    gbd = "git branch -d";

    gsh = "git stash";
    gsha = "git stash apply";
    gshp = "git stash pop";
    gshl = "git stash list";

    gcn = "git clean";
    gcnn = "git clean -fd";

    gr = "git rebase";
    gri = "git rebase -i";

    gf = "git fetch";

    gpl = "git pull";
    gplr = "git pull --rebase";

    gph = "git push";
    gphf = "git push --force";
    gphl = "git push --force-with-lease";

    grh = "git reset --hard";
  };
}
