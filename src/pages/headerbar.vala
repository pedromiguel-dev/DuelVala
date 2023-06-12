
public class Duelvala.HeaderBar : Gtk.Box{

    construct {
        var header_bar = new Adw.HeaderBar();
        header_bar.set_css_classes ({"flat"});
        header_bar.set_hexpand(true);

        append(header_bar);
    }
}
