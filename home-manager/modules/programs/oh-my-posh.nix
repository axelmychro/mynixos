{ ... }:
{
  programs.oh-my-posh = {
    enable = true;

    settings = {
      palette = {
        os = "#ffffff";
        closer = "p:os";
        blue = "#8CAAEE";
        mauve = "#ca9ee6";
        lavender = "#BABBF1";
      };

      blocks = [
        {
          alignment = "left";
          type = "prompt";

          segments = [
            {
              type = "os";
              style = "plain";
              foreground = "p:os";
              template = " ";
            }

            {
              type = "session";
              style = "plain";
              foreground = "p:mauve";
              template = "endmin ";
            }

            {
              type = "path";
              style = "plain";
              foreground = "p:mauve";
              template = "{{ .Path }} ";
              options = {
                folder_icon = " ";
                home_icon = "~";
                style = "agnoster_short";
              };
            }

            {
              type = "git";
              style = "plain";
              foreground = "p:lavender";
              template = "{{ .HEAD }} ";
              options = {
                branch_icon = " ";
                cherry_pick_icon = " ";
                commit_icon = " ";
                fetch_status = false;
                fetch_upstream_icon = false;
                merge_icon = " ";
                no_commits_icon = " ";
                rebase_icon = " ";
                revert_icon = " ";
                tag_icon = " ";
              };
            }

            {
              type = "text";
              style = "plain";
              foreground = "p:closer";
              template = "";
            }
          ];
        }
      ];

      console_title_template = "Paypal me $30.000";
      final_space = true;
      version = 5;
    };
  };
}
