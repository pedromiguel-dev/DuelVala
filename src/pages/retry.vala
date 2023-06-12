public class Duelvala.RetryPage : Gtk.Box {
    public Adw.StatusPage page {get; set;}

    construct {
        this.set_id ("retry");
        this.set_name ("retry");
        append(BuildUi());
    }

    private Adw.StatusPage BuildUi () {
        page = new Adw.StatusPage () {
          icon_name = "",
          title = "",
          hexpand = true
        };

        var clamp = new Adw.Clamp(); clamp.set_maximum_size (250);
        var button_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);

        // creating butotons
        var Button = new Gtk.Button ();

        // setting content
        var Content = new Adw.ButtonContent();
            Content.set_halign (Gtk.Align.CENTER);
            Content.set_label ("Play Again");
            Content.set_icon_name ("retry");

        Button.set_css_classes ({"pill", "suggested_action"});
        Button.set_child (Content);

        Button.set_action_name ("win.retry");

        button_box.append (Button);

        clamp.set_child (button_box);
        page.set_child (clamp);
        return page;
    }
}
