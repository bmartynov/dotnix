{ }:

let 
    workspaces = {
        w1      = "1: <#>";
        w2      = "2: <#>";
        w3      = "3: <#>";
        w4      = "4: <#>";
        w5      = "5: <#>";
        ide     = "6: ide";
        web     = "7: web";
        term    = "8: term";
        im      = "9: im";
        db      = "10: db";
    };
    criteria = {
        code = "Code";
        pycharm = "jetbrains-pycharm";
        idea = "jetbrains-idea";
        idea_ce = "jetbrains-idea-ce";
        goland = "jetbrains-goland";
        firefox = "firefox";
        google_chrome = "Google-chrome";
        xterm = "XTerm";
        pidgin = "Pidgin";
        slack = "Slack";
        telegram = "TelegramDesktop";
    };
in {
    all = with workspaces; [db w1 w2 w3 w4 w5 ide web term im];
    assigns = with criteria; with workspaces; {
        "${ide}" = [
            { class = code; } 
            { class = pycharm; }
            { class = idea; }
            { class = idea_ce; }
            { class = goland; }
        ];
        "${web}" = [
            { class = firefox; }
            { class = google_chrome; }
        ];
        "${term}" = [
            { class = xterm; }
        ];
        "${im}" = [
            { class = slack; }
            { class = telegram; }
        ];
    };
}