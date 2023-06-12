public class Duelvala.LeafLet : Gtk.Box {
    public Adw.Leaflet leaflet;
    public Duelvala.HomePage home_page;
    public Duelvala.RetryPage retry_page;

    construct {
        leaflet = new Adw.Leaflet();
        leaflet.set_id ("leafelet");

        home_page = new Duelvala.HomePage();
        retry_page = new Duelvala.RetryPage();

        leaflet.append (home_page);
        leaflet.append (retry_page);

        leaflet.set_can_unfold (false);
        leaflet.set_vexpand (true);
        leaflet.set_homogeneous (true);
        leaflet.set_can_navigate_back (true);
        leaflet.set_hexpand (true);

        append( leaflet);
    }

}
