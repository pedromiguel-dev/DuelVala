public class Duelvala.HomePage : Gtk.Box {

    construct {
        this.set_id ("home");
        this.set_name ("home");

        var home_page = new Adw.StatusPage () {
              icon_name= "welcome",
              title = "Welcome",
              description = "Let's play rock paper scissors",
              hexpand = true
        };

        var clamp = new Adw.Clamp(); clamp.set_maximum_size (250);
        var button_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);

        // creating butotons
        var RButton = new Gtk.Button (),
            PButton = new Gtk.Button (),
            SButton = new Gtk.Button ();

        // setting content
        var Rock = new Adw.ButtonContent(),
            Paper  = new  Adw.ButtonContent(),
            Scissors = new  Adw.ButtonContent();

            Rock.set_halign (Gtk.Align.CENTER);
            Paper.set_halign (Gtk.Align.CENTER);
            Scissors.set_halign (Gtk.Align.CENTER);

            Rock.set_label ("Rock");
            Paper.set_label ("Paper");
            Scissors.set_label ("Scissors");

            Rock.set_icon_name ("rock_simple");
            Paper.set_icon_name ("paper_simple");
            Scissors.set_icon_name ("scissors_simple");

        // Setting classes and content to the buttons
        RButton.set_css_classes ({"pill", "rock_button"});
        PButton.set_css_classes ({"pill", "paper_button"});
        SButton.set_css_classes ({"pill", "scissors_button"});

        RButton.set_child (Rock);
        PButton.set_child (Paper);
        SButton.set_child (Scissors);

        RButton.set_action_name ("win.rock");
        PButton.set_action_name ("win.paper");
        SButton.set_action_name ("win.scissors");

        //appending buttons to the box
        button_box.append (RButton);
        button_box.append (PButton);
        button_box.append (SButton);

        clamp.set_child (button_box);
        home_page.set_child (clamp);

        append(home_page);
    }
}
